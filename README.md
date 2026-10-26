# Mr.Shadow v18 — Dedicated Task Save Pipeline

Phone-first, local-first PWA intended for personal use through GitHub Pages.

## Files
- `index.html` — application
- `manifest.webmanifest` — PWA manifest
- `sw.js` — offline cache and update handling
- `icon.svg` — app icon
- `AUDIT_REPORT.md` — findings, fixes, test results and limitations
- `tests/task-validation.test.js` — deterministic task-validation property tests

## Local validation
Run `node tests/task-validation.test.js` to exercise the exact task title, date and priority validators extracted from the app source.

## Deployment
Export a JSON backup first. Replace `index.html`, `manifest.webmanifest`, `sw.js` and `icon.svg` in the root of the existing GitHub Pages repository. Commit and wait for publication. Do not clear browser storage before backing up.

This release has passed static checks and targeted property tests; it has not been fully end-to-end tested on a physical phone.
