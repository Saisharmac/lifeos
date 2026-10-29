# LifeOS2

A mobile-first, local-first personal operating system built with React, TypeScript and Vite.

## Included in v1.1 finance update
- Overview dashboard and daily time summary
- Toggl-style one-running-timer time tracking
- Finance command centre with regular income/expense, hand loans received/given, interest received/paid, EMI records, pocket money, and profit/loss entries
- Today dashboard spending total and pocket-money spend total
- Daily spending ledger, monthly expenses, cash-flow balance, and finance summaries
- Optional person/lender, principal, annual interest rate, EMI amount, due date, and pocket-money source fields
- Tasks with priority, due date, completion and delete
- Why Lab investigations with cause, next action and status
- Time history, basic category insights and record counts
- JSON backup export and restore
- IndexedDB storage with localStorage fallback
- Responsive dark interface and PWA manifest

## Run locally
Requires Node.js 20.19+ or 22.12+.

```bash
npm install
npm run dev
```

## Build for deployment
```bash
npm run build
```
Upload the contents of `dist/` to the root of a separate GitHub Pages repository named `lifeos2`, or configure GitHub Pages to publish that directory using an appropriate workflow. Do not overwrite the existing `lifeos` repository while testing this new app.

## Data safety
Data is saved to the current browser profile on the current device. It does not sync to a server. Export JSON backups regularly. Clearing browser site data can erase local records. Restore replaces current app data after confirmation.

## Finance accounting notes
- Cash-flow balance is recorded income-side cash received minus expense-side cash paid. Hand-loan receipts and hand-loan money lent are cash movements, not automatically profit or normal expense.
- Profit and loss entries are explicitly marked and manually recorded; they are not automatically calculated from business or trading transactions.
- Interest received/paid is tracked as its own kind of record.
- EMI records store the payment made, plus optional scheduled EMI, original principal, rate, and next due date. Automatic amortization, remaining-principal calculation, recurring reminders, and linking repayments to individual loans are not implemented yet.
- Hand-loan entries store the person, principal, rate and due date as reference fields. Repayments must be entered separately; outstanding balances are not automatically reconciled.
- Pocket-money entries count toward expense totals and the today dashboard. A source/allowance label is optional.

## Notes
This is a fresh LifeOS2 app, not a migration of existing Mr.Shadow records. The finance update preserves the existing local data shape and adds optional fields to transactions. Test saving, refresh persistence, JSON export/restore and finance calculations on the target Samsung phone before relying on it for important records.
