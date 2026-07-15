import '../domain/credential_model.dart';

class CredentialRepository {
  final String podUri;

  CredentialRepository(this.podUri);

  final List<VerifiableCredential> _offlineCredentials = [];

  Future<List<VerifiableCredential>> getCredentials() async {
    // In CSS, credentials are JWS tokens. For the viewer, we would fetch them and decode.
    try {
      // Mocking the CSS structure for the POC
      final mockRemote = [
        VerifiableCredential(
          id: 'urn:uuid:123',
          type: ['VerifiableCredential', 'DataboxConnectionCredential'],
          issuer: 'https://example.org/issuer',
          credentialSubject: {'id': 'https://alice.pod/', 'role': 'consumer'},
        ),
        VerifiableCredential(
          id: 'urn:uuid:456',
          type: ['VerifiableCredential', 'DataboxAcceptanceReceipt'],
          issuer: 'https://example.org/agency',
          credentialSubject: {'receipt': 'confirmed', 'terms': 'agreed'},
        ),
      ];
      return [...mockRemote, ..._offlineCredentials];
    } catch (e) {
      return _offlineCredentials.toList();
    }
  }

  Future<void> addConnection(String institutionUri) async {
    final newConnection = VerifiableCredential(
      id: 'urn:uuid:${DateTime.now().millisecondsSinceEpoch}',
      type: ['VerifiableCredential', 'DataboxConnectionCredential'],
      issuer: institutionUri,
      credentialSubject: {'id': podUri, 'role': 'consumer'},
    );
    _offlineCredentials.add(newConnection);
    // In a real app, this would POST to the institution's databox /register or credential issuance endpoint
  }
}
