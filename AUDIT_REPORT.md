# Mr.Shadow v30 — Complete Command Centre Directory

## User issue
The Why Lab was missing from the home page's section directory even though it existed inside Backup & Settings.

## Change
- Added a dedicated **Why Lab** tile to the home Command Centre.
- Updated the directory count from 12 to 13.
- The tile uses the existing `openWhySection` action, which navigates to Backup & Settings and scrolls directly to the Why Lab panel, preserving existing question data and form behavior.
- Kept all existing sections and the local data schema intact.
- Updated service-worker cache name to `mr-shadow-v30` so clients can refresh cached app assets.

## Validation
- Extracted inline JavaScript passed `node --check`.
- Service worker passed `node --check`.
- Manifest parsed as valid JSON.
- Asserted the home directory includes the Why Lab tile and action.
- ZIP integrity checked.

## Limitation
Static checks do not substitute for live testing on the user's Samsung phone. No app data is intentionally reset or migrated by this change.
