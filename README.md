# Mr.Shadow v23 — Finance Command Centre

Personal, local-first productivity PWA. No paid backend or bank connection is required.

## Deploy to GitHub Pages
1. Export a JSON backup from the current app.
2. Extract this package.
3. Replace `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg` in the root of the existing repository.
4. Commit the changes and wait for GitHub Pages to deploy.
5. Reopen the installed PWA and test Finance workflows before relying on the release.

## Finance additions
- Monthly dashboard, budget status and six-month recorded cash-flow trend.
- Searchable and filterable transaction ledger.
- Savings goals with contribution tracking.
- Recurring bill reminders with explicit manual payment recording.
- New Finance records are included in the existing JSON backup.

## Tests
Run `bash tests/v22-regression-checks.sh` and `bash tests/v23-finance-static-checks.sh` from this directory. These are regression/static checks, not full browser tests.

See `AUDIT_REPORT.md` for scope, research benchmark, verification and limitations.
