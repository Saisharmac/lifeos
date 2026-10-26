# Mr.Shadow v26 — Save Dispatch Root-Cause Audit

## Root cause found in the supplied `index.html`
The v25 source had a dedicated submit listener for `activityForm`, `modalHabit`, `manualForm`, `editSessionForm`, and Why Lab forms. However, the general click listener explicitly returned for those dedicated form IDs, while no dedicated click listener was present. This contradicts the comments claiming a direct click-to-handler path. On a device where the Save tap does not produce a submit event, those forms could not save.

## Change
Added a capture-phase click listener for buttons inside dedicated forms. It validates the form and calls `runDedicatedFormSave(form)` directly. Existing submit handling remains for keyboard/implicit submit. Bumped service-worker cache to `mr-shadow-v26`. Life rules (`lifeRuleForm`) and goals remain in the general form registry and already have direct click dispatch there.

## Scope
- Habit create/edit (`modalHabit`)
- Activity preset create/edit (`activityForm`)
- Manual time entry (`manualForm`)
- Existing Toggl time entry edit (`editSessionForm`)
- Life rule and goal forms use the general direct-click registry.

## Validation and limitations
JavaScript syntax and ZIP integrity checks are performed. This is source-level diagnosis based on the uploaded v25 file; no live Samsung device or deployed GitHub Pages end-to-end test was available. If life-rule or goal saves still fail after deployment, the next diagnostic is the exact on-screen toast plus browser console error, because the supplied source routes those through a different handler path.
