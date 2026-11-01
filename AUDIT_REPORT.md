# LifeOS2 v1.1 Finance Update — Audit Report

## Implemented
- Added income and expense record-type selector cards.
- Income types: regular income, hand loan received, interest received, profit.
- Expense types: regular expense, hand loan given, interest paid, EMI payment, pocket money, loss.
- Added optional date, person/lender, principal, annual interest rate, EMI amount, due date, pocket-money source and business/activity reference fields where applicable.
- Added home dashboard daily expense total and pocket-money spent today.
- Added finance summary cards, today's spending list, and search over category, notes, counterparty and pocket-money source.
- Cash-flow and profit/loss labels distinguish cash movement from manually recorded profit/loss entries.
- Added accounting notes and limitations to README and FINANCE_DESIGN.md.
- Preserved prior transaction compatibility by making new fields optional. No database reset or schema version change.
- Updated service worker cache name to invalidate the previous shell cache.

## Checks performed
- TypeScript transpile/syntax check passed for `src/App.tsx`, `src/db.ts`, and `src/main.tsx` using the globally available TypeScript compiler API.
- Full `npm run build` could not be verified: dependency installation timed out in this environment, and the project's React/Vite dependencies were not present locally.
- No real browser, mobile-device, IndexedDB persistence, or end-to-end test was performed.

## Known limitations
- Hand-loan principal, rate, person and due date are stored as reference details; repayments must be entered separately. Outstanding balances are not automatically matched/reconciled.
- EMI entry stores amount paid and optional schedule/reference fields; automatic amortization, remaining-principal calculation and recurring reminders are not implemented.
- Profit/loss is manually recorded, not automatically derived from trading or business transactions.
- The cash-flow balance includes all recorded income-side and expense-side cash movements, including hand loans; it is not net worth or accounting profit.
- Existing data should be exported before deploying any update. Existing local transactions are not migrated to a cloud database.

## Toggl idle-time behavior update (v1.2)
- Removed any need for an always-running Idle timer. No idle entry is started, stopped, or persisted.
- Added full-calendar-day coverage: idle includes time before the first activity, between activities, and after the last activity up to now (or midnight for completed days).
- Sleep is treated like any other recorded activity. Cross-midnight entries are split by local calendar day, and overlapping intervals are merged before gaps are calculated to avoid double-counting.
- Today is calculated from local midnight through the current moment; completed past days are calculated through the next local midnight. The current day grows dynamically as time passes, without running or storing an Idle timer.
- Added manual time entry with activity, category, start date/time, and end date/time. It rejects invalid durations and overlaps with existing entries.
- Time before the first recorded activity is included as idle, because the user selected full 24-hour calendar-day accounting and records sleep as an activity.
- Build/browser test limitation: dependency installation timed out in this environment, so a full Vite production build and device interaction test could not be completed.
