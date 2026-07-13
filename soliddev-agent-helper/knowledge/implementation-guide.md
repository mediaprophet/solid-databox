# Agent Implementation Guide for Solid

This file provides concrete coding patterns and library usage rules for AI agents building Solid applications.

## 1. Library Selection
- **Frontend/React:** Use `@inrupt/solid-client`, `@inrupt/solid-client-authn-browser`, and `@inrupt/solid-ui-react`.
- **Node.js/Backend:** Use `@inrupt/solid-client`, `@inrupt/solid-client-authn-node`.
- **Low-level RDF manipulation:** If `@inrupt/solid-client` is too high-level, use `rdflib.js` or `N3.js`.
- **Querying:** For SPARQL querying across multiple resources, use `Comunica` (`@comunica/query-sparql-solid`).

## 2. Authentication Pattern
**Agent Rule:** Never attempt to read/write private Pod data without passing the `fetch` function from the authenticated session.

```javascript
import { login, handleIncomingRedirect, getDefaultSession } from "@inrupt/solid-client-authn-browser";

// 1. Trigger Login
async function startLogin(oidcIssuer) {
  await login({
    oidcIssuer,
    redirectUrl: window.location.href,
    clientName: "My Solid App"
  });
}

// 2. Handle Redirect on page load
async function finishLogin() {
  await handleIncomingRedirect();
  const session = getDefaultSession();
  if (session.info.isLoggedIn) {
    console.log("Logged in as:", session.info.webId);
    return session.fetch; // PASSED TO ALL SOLID-CLIENT FUNCTIONS!
  }
}
```

## 3. Reading and Writing Data Pattern
**Agent Rule:** Solid operations are asynchronous and network-bound. Handle errors (401, 403, 404).

```javascript
import { getSolidDataset, saveSolidDatasetAt, setThing, createThing, buildThing } from "@inrupt/solid-client";
import { FOAF } from "@inrupt/vocab-common-rdf";

async function addFriend(podUri, friendWebId, fetch) {
  const datasetUrl = `${podUri}friends/myFriends.ttl`;
  
  let dataset;
  try {
    // Attempt to fetch existing data
    dataset = await getSolidDataset(datasetUrl, { fetch });
  } catch (e) {
    if (e.statusCode === 404) {
      // Create new dataset if it doesn't exist
      dataset = createSolidDataset();
    } else {
      throw e;
    }
  }

  // Build the new Thing (RDF Subject)
  const newFriend = buildThing(createThing())
    .addUrl(FOAF.knows, friendWebId)
    .build();

  // Add the Thing to the dataset
  const updatedDataset = setThing(dataset, newFriend);

  // Save back to the Pod
  await saveSolidDatasetAt(datasetUrl, updatedDataset, { fetch });
}
```

## 4. Handling WebID Profiles
**Agent Rule:** Don't hardcode `pim:storage`. Discover it.

```javascript
import { getSolidDataset, getThing, getUrl } from "@inrupt/solid-client";

async function getStorageEndpoint(webId, fetch) {
  const profileDataset = await getSolidDataset(webId, { fetch });
  const profileThing = getThing(profileDataset, webId);
  // 'http://www.w3.org/ns/pim/space#storage'
  const storageUrl = getUrl(profileThing, "http://www.w3.org/ns/pim/space#storage");
  return storageUrl;
}
```
