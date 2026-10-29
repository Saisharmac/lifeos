# LifeOS2 Finance — detailed feature design

## Finance workspace
- Cash-flow balance: all recorded income-side inflows minus expense-side outflows.
- Spent today: all expense records dated today.
- Pocket-money spent: today's expenses marked as pocket money.
- Monthly expenses: all expense-side cash movements in the current month.
- Profit and loss: separately marked, manually recorded profit and loss totals.
- Income and expense summaries include interest earned/paid as separately tracked records.

## Income record types
1. Regular income: salary, freelance, business income, investment, gift, refund, other.
2. Hand loan received: lender/person, amount received, principal, annual interest rate, due date, notes. Classified as a cash inflow / liability reference, not automatically profit.
3. Interest received: interest amount, related principal, annual rate, person/account reference.
4. Profit: a manually recorded profit amount with business/activity reference.

## Expense record types
1. Regular expense: food, transport, bills, shopping, health, education, travel, home, other.
2. Hand loan given: borrower/person, amount sent, principal, annual rate, repayment due date. Classified as a cash outflow / receivable reference, not automatically an expense for profit-and-loss purposes.
3. Interest paid: interest amount, related principal, annual rate, loan/account reference.
4. EMI payment: amount paid now, loan name, original principal, scheduled EMI, annual rate, next due date.
5. Pocket money: amount spent, source/allowance name and spend category. Included in daily spending.
6. Loss: a manually recorded loss amount with business/activity reference.

## Record integrity rules
- Every entry requires a positive amount and a date.
- Hand loan entries require a person/lender name.
- Old transactions without the new optional fields remain readable.
- Export/restore continues to include the entire app data object.
- Loan principal is not automatically counted as profit/loss. The app currently does not calculate amortization, automatically match repayments, or calculate outstanding loan balances.
