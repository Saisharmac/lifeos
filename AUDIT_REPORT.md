# Mr.Shadow v23 — Finance Command Centre Audit

## Scope
This release starts from the v22 Why Lab / save-reliability baseline. It upgrades the Finance screen only and preserves the existing local-first storage approach and prior records. No bank API, paid service, analytics SDK, or remote finance provider was added.

## Finance features added
- Monthly dashboard with tracked account balances, income, expenses, and net cash flow.
- Selected-month budget summary and over-budget category warning.
- Six-month recorded income-versus-expense trend (not a forecast).
- Searchable transaction ledger with type and category filters.
- Expense/income/transfer selector with transfer destination control.
- Category budget progress with spent, limit, remaining/over amount, and overflow actions.
- Savings goals with target, saved amount, due date, percentage progress, contribution action, edit, and delete.
- Recurring bill reminders with weekly/monthly/yearly cadence, next due date, pause/resume, and manual mark-paid flow. Mark-paid records an expense only; it never pays a bill through a bank.
- Finance-specific responsive styling and more compact progressive disclosure for account creation and optional notes.
- Finance goals and recurring reminders survive normalization and full JSON backups.
- Updated service-worker cache to `mr-shadow-v23`.

## Design principles
- Manual, local-first records; no bank credentials are collected.
- Transactions and savings targets are not treated as verified bank balances.
- Transfers are distinct from income and expenses.
- Recurring bills create a transaction only after explicit user confirmation and account/date selection.
- Monthly budget spending is computed from expense transactions in the selected month.
- Existing finance `accounts`, `transactions`, and `budgets` are preserved; new `goals` and `recurring` arrays default safely when absent.

## Desk-research benchmark
The design was informed by publicly available comparison and product pages for budgeting, cash-flow forecasting, manual expense tracking, savings goals, recurring payments, net-worth visibility, and data export. It is a feature-pattern benchmark, not a claim that every product was installed and tested individually.

Products considered in the 50-product landscape:
1. YNAB
2. Monarch Money
3. Quicken Simplifi
4. Quicken Classic
5. Empower Personal Dashboard
6. Goodbudget
7. EveryDollar
8. PocketGuard
9. Rocket Money
10. Honeydue
11. WalletHub
12. Tiller Money
13. Copilot Money
14. Origin
15. Cleo
16. Albert
17. PocketSmith
18. Spendee
19. Wallet by BudgetBakers
20. Money Manager (Realbyte)
21. Monefy
22. Fold Money
23. INDmoney
24. FinArt
25. Axio (formerly Walnut)
26. CRED
27. Jupiter
28. Fi Money
29. Moneyview
30. ET Money
31. Splitwise
32. Unyfy
33. Easy Hisab
34. PAIZA Money Manager
35. NerdWallet
36. Credit Karma
37. Banktivity
38. Lunch Money
39. Actual Budget
40. Aspire Budget
41. Fudget
42. Buddy
43. Wally
44. Toshl Finance
45. Buxfer
46. Bankin'
47. Emma
48. Snoop
49. Plum
50. MoneyWiz

This landscape includes products for different countries and purposes. Their features, prices, availability, and bank connectivity are not assumed to be interchangeable. Mr.Shadow adopts patterns that fit a free, offline-capable, manually maintained personal app and deliberately excludes financial-account linking.

## Verification performed
- Application JavaScript syntax: passed (`node --check`).
- Service-worker syntax: passed (`node --check`).
- Manifest JSON and required fields: passed.
- HTML parser: passed.
- Existing v22 regression script: passed (dedicated activity/habit save pipeline, Why Lab persistence and routing checks).
- Finance static regression script: 14 checks passed for dashboard, trend, ledger filters, budget warnings, goal forms/storage, recurring bill forms/payment confirmation, data normalization, cache version and markup parsing.
- ZIP integrity: checked after packaging.

## Not verified
- No successful end-to-end browser session or physical Samsung-device interaction was available in this run.
- The six-month chart is based only on manually recorded transactions and is not predictive.
- No account aggregation, SMS parsing, bank reconciliation, tax advice, investment recommendation, automatic payment, or system notification is included.
- Existing credit-card account balances should be reconciled against statements; the dashboard sums recorded account balances and does not claim a complete audited net-worth figure.

## Deploy
Back up the app using its JSON export. Extract the ZIP and replace `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg` at the root of the existing GitHub Pages repository. Commit, wait for deployment, and test account creation, transaction entry, transfer entry, filters, budget updates, goal contribution, recurring bill creation and mark-paid, reload persistence, and backup restore.
