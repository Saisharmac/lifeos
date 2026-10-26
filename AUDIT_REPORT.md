# Mr.Shadow v31 — Focused Workspace

## Requested navigation
The visible workspace is narrowed to four core areas: Toggl, Finance, Tasks, and Why Lab. The Command Centre also links to Time History, Reports & Statistics, and Backup & Settings.

## Hidden, not erased
Habits, Life Rules, Goals, Calendar, Notes, and Projects & Tags are removed from the primary navigation and Command Centre directory. Their code and data fields are retained in this build; no records are intentionally deleted. Existing historical sessions, reports/statistics, task records, finance records, and Why Lab questions remain in the local data model.

## Persistence and data safety
This is a navigation/visibility change, not a database reset or destructive migration. Export a JSON backup before deploying any new version. Why Lab remains implemented in Settings and is reachable via its direct action link.

## Validation
- Extracted inline JavaScript passes `node --check`.
- Service-worker JavaScript passes `node --check`.
- Manifest parses as JSON.
- ZIP integrity check passes.
- No live browser or physical-device end-to-end test was performed.
