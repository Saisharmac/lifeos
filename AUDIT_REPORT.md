# Mr.Shadow v18 — Dedicated Task Save Pipeline & Repeated Audit

## Scope and honesty

This is a layered code audit and targeted refactor of the v17 source. The request to find and fix 1,000 bugs is not a defensible engineering target: bugs cannot be truthfully invented to meet a count. Instead, this release records concrete defects found, changes made, repeatable checks run, and limitations. It does **not** claim 1,000 defects were found, nor that every UI workflow has been proven bug-free.

## Concrete issues found and fixed

1. **Task quick-add had a separate persistence implementation.** `taskQuickAdd` used `handleTaskQuickAdd`, while the Today form and modal used `saveTaskForm`. The separate path could drift in validation, persistence and post-save behaviour. All task creation/editing entry points now use `saveTaskForm`.
2. **Task forms were still routed through the general form registry.** Task forms have been removed from `FORM_HANDLERS` and are intercepted by a dedicated capture-phase submit listener that prevents downstream handlers from processing the same submission.
3. **Invalid calendar dates could pass basic date parsing.** For example, some JavaScript date parsers roll an impossible date into the next month. Task due dates now require a strict `YYYY-MM-DD` value that round-trips to the same local calendar date.
4. **Editing checklists could not reliably remove all checklist rows.** An empty checklist was treated as “keep the old checklist.” The editor now distinguishes between a form that has a checklist field and a quick-add form that does not; an intentionally empty editor checklist clears the checklist, while quick-add preserves no checklist data.
5. **Repeated validation logic could drift.** Task title, due-date and priority normalization now use shared pure helpers.

## New task submission design

- Dedicated task form IDs: `quickTaskForm`, `taskQuickAdd`, `taskForm`, `modalTask`.
- Dedicated submit listener calls `saveTaskForm` directly and calls `preventDefault()` plus `stopImmediatePropagation()`.
- A dispatch lock and save lock guard duplicate submissions.
- Create/edit use the same validation, record mutation, persistence, rollback/error feedback and refresh path.
- Existing task IDs, completion state, completion timestamp, creation timestamp and checklist completion state are preserved when editing where applicable.
- Project IDs are checked against existing projects before saving.
- Due dates are validated as actual calendar dates, not merely parseable strings.
- If persistence fails, the code checks whether the current local snapshot contains the intended task before deciding whether to roll back.

## Audit rounds

### Round 1 — Source integrity
- JavaScript syntax: PASS (`node --check`).
- Service-worker syntax: PASS (`node --check`).
- Manifest JSON: PASS (`python -m json.tool`).
- ZIP archive integrity: PASS (`unzip -t`).

### Round 2 — Form routing
- 20 form IDs found in the source templates.
- Task form IDs explicitly listed in `TASK_FORM_IDS`.
- Task forms removed from the general `FORM_HANDLERS` registry.
- Static check confirms the dedicated listener invokes `saveTaskForm`.
- No remaining task-form registry aliases from the previous design.

### Round 3 — Data validation and editing
- Empty and whitespace-only titles rejected.
- 240-character title boundary checked.
- Empty due date accepted; valid leap day accepted; invalid leap day and impossible dates rejected.
- Invalid priorities safely normalize to `normal`.
- Empty checklist editor and quick-add-without-checklist have separate semantics.
- Nonexistent selected project is rejected before mutation.

### Round 4 — Repeated randomized property checks
The included deterministic Node test extracts and tests the exact pure validator functions from `index.html`. It ran 1,000 generated input iterations, producing over 3,000 randomized assertions across title trimming/length boundaries, calendar-date round-tripping and priority normalization, in addition to fixed edge-case checks. Result: PASS.

Run it from this folder with:

```bash
node tests/task-validation.test.js
```

### Round 5 — Deployment assets
- Service-worker cache changed to `mr-shadow-v18`.
- Existing localStorage key and IndexedDB database/store identifiers were not intentionally changed.
- Manifest validated and archive checked.

## Important limitations

- This environment does not provide a functioning browser automation run for the deployed PWA, so the full interactive app was not end-to-end tested on a Samsung device.
- Randomized property tests cover the pure validators, not every UI component, storage failure mode, or browser lifecycle.
- Static checks cannot guarantee every action branch behaves correctly at runtime.
- Local browser storage can still be cleared by the browser/OS. Export JSON backups before deploying.

## Deployment

Replace `index.html`, `manifest.webmanifest`, `sw.js` and `icon.svg` in the repository root after exporting a JSON backup. Commit, wait for GitHub Pages to publish, reopen the installed PWA and test all four task entry points: Today quick-add, Tasks quick-add, modal create, and modal edit. Also verify task completion, play-to-track, checklist edits, invalid dates, reload persistence and backup export.
