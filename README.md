# Mr.Shadow v26 — Save Button Dispatch Fix

## Install
1. Export a JSON backup first.
2. Replace `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg` in the existing GitHub Pages repository.
3. Commit and wait for Pages to publish. Reopen the app.

## Fix
The v25 code excluded dedicated forms from the general click-save listener, but only attached a submit listener for those forms. That meant a tap on Save could miss the dedicated handler. v26 adds the missing direct click listener for dedicated forms (habits, activity presets, manual time entries, and edited time entries). Life rules remain routed through their registered form handler.

Static checks are not a substitute for live testing on the user's device. Export a backup before deployment.
