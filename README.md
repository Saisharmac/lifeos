# Mr.Shadow v13 — Phone-only PWA

Personal, local-first life-management app designed for mobile use and hosted on GitHub Pages.

## v13 changes
- Reworked the Toggl activity editor to bind a dedicated submit handler directly to the activity form.
- Unified the create/edit/target-update path, with persistence awaited before the modal closes.
- Added save-in-progress protection, duplicate-name prevention, and clearer persistence fallback handling.
- Preserved the existing localStorage key and IndexedDB database/store/key.
- Bumped the service-worker cache to `mr-shadow-v13`.

## Deploy safely
1. Export a JSON backup from your current app first.
2. Extract the ZIP.
3. Replace `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg` in the root of your existing GitHub repository.
4. Commit the changes and wait for GitHub Pages to publish.
5. Fully close/reopen the installed PWA or reload the site to activate the v13 cache.
6. Test creating an activity, editing an existing target, reloading, and exporting a backup.

See `AUDIT_REPORT.md` for the audit scope and testing limitations. Code syntax, manifest, static dispatch checks and activity-save unit tests passed; full real-device end-to-end verification is still required.
