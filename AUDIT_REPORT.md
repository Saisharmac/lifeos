# Mr.Shadow v25 — Save Button Reliability Patch

## User-reported failures addressed
- Creating a new habit or saving edits to a habit.
- Saving a new or edited life goal.
- Adding a manual Toggl time entry and saving edits to an existing time entry.
- Activity preset create/edit save actions.

## Change
The previous build relied on normal browser form-submit behavior for some non-dedicated forms. This patch adds a direct click-to-handler path for every registered form's Save button, while retaining the submit-event path for keyboard submission. Dedicated habit/Toggl forms keep their dedicated handlers. The click handler validates required fields, prevents duplicate submission while saving, and shows a useful error if the handler rejects. The service-worker cache is bumped to `mr-shadow-v25`.

## Data safety
The app remains local-first. Export a JSON backup before replacing files. No data is uploaded by this patch. If local browser storage itself is blocked or full, a save can still fail; the app should show an error rather than pretending it succeeded.

## Validation
- `node --check` on extracted inline JavaScript and `sw.js`.
- Existing v22 regression checks.
- Existing v23 finance static checks.
- v24 save regression checks, expanded to assert direct click dispatch for registered forms.
- ZIP integrity check.

These are static/regression checks. No physical Samsung-device end-to-end test was available, so do not interpret them as a guarantee of live-device behavior.
