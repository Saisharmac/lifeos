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

## Deploy from a phone using GitHub Actions
1. Create a separate GitHub repository named `lifeos2` (do not overwrite the existing `lifeos` repository).
2. Upload the **contents of this project folder** to the repository root. Include the hidden `.github/workflows/deploy.yml` file. Do not upload the ZIP itself, and do not publish the raw source folder as the Pages site.
3. Open the repository's **Settings → Pages** and set **Build and deployment → Source** to **GitHub Actions**.
4. Open the **Actions** tab and wait for **Build and deploy LifeOS2 to GitHub Pages** to finish successfully.
5. Open `https://<your-github-username>.github.io/lifeos2/`.

GitHub Actions installs dependencies, runs the Vite production build, and publishes only the generated `dist/` folder. The project uses a relative Vite base path so it works under the `/lifeos2/` repository path.

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


### Toggl idle-time calculation
Idle time is not a continuously running timer. For every calendar day from the earliest recorded activity through today, LifeOS2 treats the unoccupied portions of the day as calculated idle. This includes time from midnight to the first activity, gaps between activities, and the elapsed portion after the final activity. Today is calculated only up to the current moment; completed past days are covered through the next midnight. Activities crossing midnight are split across the relevant days, and overlapping intervals are merged so time is never double-counted. Sleep is an ordinary recorded activity. Idle gaps are derived and are not saved as sessions.
