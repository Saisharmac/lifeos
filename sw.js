const CACHE = 'lifeos2-shell-finance-v2';
self.addEventListener('install', event => { event.waitUntil((async () => { await self.skipWaiting(); })()); });
self.addEventListener('activate', event => { event.waitUntil((async () => { const keys = await caches.keys(); await Promise.all(keys.filter(k => k.startsWith('lifeos2-shell-') && k !== CACHE).map(k => caches.delete(k))); await self.clients.claim(); })()); });
self.addEventListener('fetch', event => {
  const request = event.request;
  if (request.method !== 'GET' || new URL(request.url).origin !== self.location.origin) return;
  event.respondWith((async () => {
    try { const response = await fetch(request); if (response.ok && (request.destination === 'document' || ['script','style','image','font'].includes(request.destination))) { const cache = await caches.open(CACHE); cache.put(request, response.clone()); } return response; }
    catch { const cached = await caches.match(request); if (cached) return cached; if (request.mode === 'navigate') return (await caches.match('./index.html')) || Response.error(); return Response.error(); }
  })());
});
