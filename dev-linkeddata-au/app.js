document.addEventListener('DOMContentLoaded', async () => {
    let rawData = [];
    let filteredData = [];
    const activeFilters = {
        category: new Set(),
        type: new Set(),
        language: new Set()
    };
    let searchQuery = '';

    function escapeHTML(value) {
        return String(value ?? '')
            .replaceAll('&', '&amp;')
            .replaceAll('<', '&lt;')
            .replaceAll('>', '&gt;')
            .replaceAll('"', '&quot;')
            .replaceAll("'", '&#039;');
    }

    function itemCategories(item) {
        if (Array.isArray(item.categories) && item.categories.length > 0) {
            return item.categories;
        }
        return item.category ? [item.category] : [];
    }

    const elements = {
        facetsContainer: document.getElementById('facetsContainer'),
        resourcesGrid: document.getElementById('resourcesGrid'),
        resultsCount: document.getElementById('resultsCount'),
        searchInput: document.getElementById('searchInput'),
        resetFilters: document.getElementById('resetFilters')
    };

    // Load data
    try {
        const response = await fetch('data.json');
        rawData = await response.json();
        filteredData = [...rawData];
        initApp();
    } catch (error) {
        elements.resultsCount.textContent = 'Failed to load resources.';
        console.error('Error loading data:', error);
    }

    function initApp() {
        renderFacets();
        renderResources();
        setupEventListeners();
    }

    function setupEventListeners() {
        elements.searchInput.addEventListener('input', (e) => {
            searchQuery = e.target.value.toLowerCase();
            applyFilters();
        });

        elements.resetFilters.addEventListener('click', () => {
            activeFilters.category.clear();
            activeFilters.type.clear();
            activeFilters.language.clear();
            searchQuery = '';
            elements.searchInput.value = '';
            
            // Uncheck all checkboxes
            document.querySelectorAll('input[type="checkbox"]').forEach(cb => cb.checked = false);
            
            applyFilters();
        });
    }

    function renderFacets() {
        const facets = {
            category: extractFacetCounts('category'),
            type: extractFacetCounts('type'),
            language: extractFacetCounts('language')
        };

        let facetsHTML = '';
        
        if (Object.keys(facets.category).length > 0) {
            facetsHTML += createFacetGroupHTML('Category', 'category', facets.category);
        }
        if (Object.keys(facets.type).length > 0) {
            facetsHTML += createFacetGroupHTML('Type', 'type', facets.type);
        }
        if (Object.keys(facets.language).length > 0) {
            facetsHTML += createFacetGroupHTML('Language', 'language', facets.language);
        }

        elements.facetsContainer.innerHTML = facetsHTML;

        // Add event listeners to checkboxes
        document.querySelectorAll('.facet-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', (e) => {
                const group = e.target.dataset.group;
                const value = e.target.value;
                
                if (e.target.checked) {
                    activeFilters[group].add(value);
                } else {
                    activeFilters[group].delete(value);
                }
                
                applyFilters();
            });
        });
    }

    function extractFacetCounts(key) {
        const counts = {};
        rawData.forEach(item => {
            const values = key === 'category' ? itemCategories(item) : [item[key]];
            values.forEach(value => {
                if (value) counts[value] = (counts[value] || 0) + 1;
            });
        });
        
        // Sort by count descending
        return Object.fromEntries(
            Object.entries(counts).sort(([,a], [,b]) => b - a)
        );
    }

    function createFacetGroupHTML(title, groupKey, facetData) {
        let itemsHTML = Object.entries(facetData).map(([value, count]) => `
            <label class="facet-item">
                <input type="checkbox" class="facet-checkbox" data-group="${escapeHTML(groupKey)}" value="${escapeHTML(value)}">
                <span>${escapeHTML(value)}</span>
                <span class="facet-count">${count}</span>
            </label>
        `).join('');

        return `
            <div class="facet-group">
                <h3>${title}</h3>
                <div class="facet-list">
                    ${itemsHTML}
                </div>
            </div>
        `;
    }

    function applyFilters() {
        filteredData = rawData.filter(item => {
            // Check Search
            let matchesSearch = true;
            if (searchQuery) {
                const textToSearch = `${item.title} ${item.description} ${item.link}`.toLowerCase();
                matchesSearch = textToSearch.includes(searchQuery);
            }

            // Check Facets
            let matchesCategory = activeFilters.category.size === 0 ||
                itemCategories(item).some(category => activeFilters.category.has(category));
            let matchesType = activeFilters.type.size === 0 || activeFilters.type.has(item.type);
            let matchesLanguage = activeFilters.language.size === 0 || activeFilters.language.has(item.language);

            return matchesSearch && matchesCategory && matchesType && matchesLanguage;
        });

        renderResources();
    }

    function renderResources() {
        elements.resultsCount.textContent = `Showing ${filteredData.length} resource${filteredData.length !== 1 ? 's' : ''}`;
        
        if (filteredData.length === 0) {
            elements.resourcesGrid.innerHTML = `
                <div class="resource-card" style="grid-column: 1 / -1; text-align: center; padding: 3rem;">
                    <h3 style="color: var(--text-secondary);">No resources found matching your criteria</h3>
                    <p style="margin-top: 0.5rem;">Try adjusting your filters or search term.</p>
                </div>
            `;
            return;
        }

        const resourcesHTML = filteredData.map(item => {
            const titleDisplay = escapeHTML(item.title || 'Untitled resource');
            const linkHref = item.link && /^https?:\/\//i.test(item.link) ? item.link : '#';
            const isExternal = linkHref !== '#';
            
            const badgesHTML = [
                ...itemCategories(item).map(category => `<span class="badge category">${escapeHTML(category)}</span>`),
                ...(item.type ? [`<span class="badge">${escapeHTML(item.type)}</span>`] : [])
            ].join('');
            
            return `
                <div class="resource-card">
                    <div class="card-header">
                        <h3 class="card-title">
                            ${isExternal ? `<a href="${escapeHTML(linkHref)}" target="_blank" rel="noopener noreferrer">${titleDisplay}</a>` : titleDisplay}
                        </h3>
                    </div>
                    <div class="card-badges">
                        ${badgesHTML}
                    </div>
                    <div class="card-desc">
                        ${item.description ? escapeHTML(item.description) : '<span style="opacity: 0.5; font-style: italic;">No description provided</span>'}
                    </div>
                    <div class="card-footer">
                        ${isExternal ? `
                            <a href="${escapeHTML(linkHref)}" class="card-link" target="_blank" rel="noopener noreferrer">
                                Visit Link
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"></line><polyline points="7 7 17 7 17 17"></polyline></svg>
                            </a>
                        ` : '<span></span>'}
                        <span class="card-meta">${escapeHTML(item.language || '')}</span>
                    </div>
                </div>
            `;
        }).join('');

        elements.resourcesGrid.innerHTML = resourcesHTML;
    }
});
