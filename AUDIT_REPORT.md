# Mr.Shadow v24 — Save Pipeline Fix

## User-reported issue
Saving edits to manual time entries and creating habits did not work reliably.

## Changes
- Routed habit creation/editing, manual time entry creation, and manual time entry editing through the same dedicated save pipeline on both button click and keyboard form submission.
- The dedicated pipeline prevents overlapping generic form handlers, disables the submit button while saving, and restores the button afterward.
- Preserved validation and rollback behavior if persistence fails.
- Bumped service-worker cache key to `mr-shadow-v24` to reduce stale-script delivery after deployment.
- Retained the v23 Finance Command Centre features and local-first storage approach.

## Validation
- v22 regression checks passed.
- v23 finance static checks passed with the v24 cache key.
- v24 save-pipeline regression checks passed.
- Inline JavaScript and service worker passed `node --check`; manifest passed JSON validation.
- ZIP integrity checked after packaging.

## Limitations
These are static/code-level regression checks. No live browser automation or physical Samsung-device test was available, so this is not a claim of end-to-end device verification.
