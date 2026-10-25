# Mr.Shadow v13 — Master Code Audit Report

## Release objective
Repair the reported Toggl activity editor defect without replacing the app, changing its identity, or changing existing local data identifiers.

## Important defect repaired
The activity editor previously relied on a delegated click action for its Save button while also having a separate document-level submit handler. That split path made the save workflow unnecessarily fragile and difficult to reason about. In v13:

- The Save activity control is a native `type="submit"` button.
- The activity form binds its own submit handler immediately after the modal is created. The handler prevents the normal navigation/submission and calls the single `saveActivityForm()` path directly.
- The old delegated save action and duplicate capture-phase activity-submit handler have been removed.
- The save function awaits persistence before closing the form.
- If IndexedDB writing fails but the localStorage snapshot contains the saved activity, the app keeps the saved record and reports the fallback condition in the console. If neither persisted snapshot contains the new record, the app rolls back the in-memory change and leaves the form open with an error.
- A double-tap guard prevents duplicate submissions while saving.
- Duplicate activity names (case-insensitive) are rejected to avoid ambiguous tracking tiles.
- Target mode, whole-number hours/minutes, the 24-hour limit, positive targets, missing edit records, and the eight-pinned-activity limit are validated.
- Existing activity IDs are retained when editing; existing records are updated in place rather than duplicated.

## Checks performed
- Main inline JavaScript syntax check with Node.js: passed.
- Service-worker syntax check with Node.js: passed.
- Web app manifest JSON parse: passed.
- Static HTML duplicate-ID check: passed.
- Static `data-action` inventory compared with dispatcher branches: passed (excluding a deliberate template placeholder and modal backdrop control).
- Confirmed localStorage key `lifeos-v3-data` remains unchanged.
- Confirmed IndexedDB database/store/key (`lifeos-local-db` / `records` / `main`) remain unchanged.
- Confirmed the service-worker cache is bumped to `mr-shadow-v13`.
- Unit tests against the actual extracted `saveActivityForm()` function: passed for create, edit-in-place, changing a target from 90 to 135 minutes and changing target mode, duplicate-name rejection, invalid 24h+1m rejection, and the eight-pinned-activity limit.
- ZIP integrity check: run when packaging this release.

## Verification limitations
A full interactive browser test could not run because Chromium navigation to the local test server was blocked by the execution environment (`ERR_BLOCKED_BY_ADMINISTRATOR`). Therefore this report does not claim successful full end-to-end browser or Samsung-device testing, and it cannot promise that every feature is bug-free. The unit tests exercise the activity-save function but do not replace real-device testing of the full application.

## Data safety
Before replacing the deployed app, export a JSON backup from the currently installed app. Do not clear site data or uninstall the PWA as a troubleshooting step before exporting. The app stores data locally; GitHub Pages does not back up those records.

## Deployment
1. Export a JSON backup from the current Mr.Shadow app.
2. Extract this ZIP.
3. Replace `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg` in the root of the existing `saisharmac/lifeos` repository. Do not rename the repository or upload an extra parent folder that leaves `index.html` nested.
4. Commit and wait for GitHub Pages to publish.
5. Fully close and reopen the installed PWA or reload the website so the `mr-shadow-v13` service worker can activate.
6. Test: create a new activity; edit an existing activity's target; reload; confirm both persist; then export a fresh backup.
