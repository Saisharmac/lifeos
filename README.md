# Mr.Shadow v19 — Futuristic UI + Task Add Reliability

Phone-first, local-first PWA for GitHub Pages.

## Deploy
Back up your in-app JSON first. Upload `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg` to the root of the existing GitHub Pages repository and commit. Keep `index.html` at the repository root.

## Task add fix
Task quick-add and modal task submit buttons now have a direct capture-phase click-to-save path, in addition to a dedicated submit handler for keyboard submission. Both call the same `saveTaskForm` routine. The click path prevents implicit form submission from racing the dedicated submit handler.

## Data safety
Existing localStorage and IndexedDB identifiers are preserved. Export a JSON backup before deployment. Browser storage can still be cleared by the operating system or browser.
