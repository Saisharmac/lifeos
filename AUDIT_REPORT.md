# Mr.Shadow v27 — Unified Save Dispatcher

## Why this differs from v26
The source contained multiple overlapping capture-phase click/submit dispatchers (task-specific, dedicated-form, and generic-form). v27 replaces those competing dispatchers with one click path and one submit path sharing one per-form lock. The same handler registry routes habits, life rules, Toggl activity presets, manual entries, session edits, goals, and other registered forms.

## Safety
The app remains local-first. Export a JSON backup before replacing files. This patch does not clear existing browser storage. Save failures should leave the form open and log a console error.

## Validation
Static JavaScript syntax check, service-worker syntax check, registry assertions for the affected forms, and ZIP integrity check passed. No physical device/browser end-to-end test was available.
