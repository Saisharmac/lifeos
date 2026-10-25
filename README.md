# LifeOS Level 10 — Personal Operating System

A single-page progressive web app for personal use, designed around manual time tracking, tasks, habits, goals, notes, calendar and reports.

## Included
- Dashboard with today's tracked time, task count, habit check-ins, daily target, weekly bars, quick task/note actions.
- Toggl-inspired timer: one running timer, projects, comma-separated tags, task links, edit/discard/stop, manual time entry, duplicate session, session history, per-day and per-project reporting.
- Tasks: due date, priority, category, project, notes, open/today/overdue/next-7-days/completed filters, checkbox completion, track time from a task.
- Calendar: monthly view with time-session dots, task deadlines, selectable day and daily summaries.
- Habits: daily check-in history, streaks, minimum viable habit, frequency/category and seven-day view.
- Goals: measurable target/current progress, unit, deadline, status, why, linked tasks and linked time sessions.
- Notes: title, body, tags, search, edit and delete.
- Reports: 14-day totals, average, project breakdown, CSV export.
- Projects and tags.
- Finance: manual accounts/wallets, opening balances, income, expenses, inter-account transfers, category budgets, monthly filtering, account balances and transaction history. Financial data is never imported from banks automatically.
- JSON backup/restore, CSV export, local settings and optional manual phone/computer snapshot sync.
- Offline app shell and responsive mobile layout.
- First-run migration attempts known legacy keys and preserves all old keys.

## Deploy in one update
1. Open the current LifeOS site and export a JSON backup before replacing anything.
2. Download and extract `LifeOS_Level10_Deploy.zip`.
3. In the existing GitHub repository, upload and replace **all four** site files: `index.html`, `manifest.webmanifest`, `sw.js`, `icon.svg`. Keep the repository name and Pages configuration the same.
4. Commit changes. Wait for Pages deployment.
5. Open `https://saisharmac.github.io/lifeos/` and refresh. The service worker cache name is versioned.
6. Check existing data and export a fresh backup.

## Migration notes
The app writes to `lifeos-v3-data`. If that key does not exist, it checks `lifeos-v2-data`, `lifeos-v1-data`, `lifeos-data`, and `lifeos`. It copies recognizable tasks, sessions, habits, habit history, notes, goals, projects, settings, running timer and reminders into the v3 structure; old keys are not deleted. Since your prior starter may have used a different shape, export the old JSON first. Data in localStorage is scoped to the exact origin and browser profile; data on another device must be imported there.

## Phone/computer sync
The app works locally without an account. To enable optional manual snapshot sync:
1. Create a Supabase project and check its current free-tier limits.
2. Run `supabase-setup.sql` in Supabase SQL Editor.
3. Copy Project URL and the public anon/publishable key (not service_role).
4. Open LifeOS → Backup & sync on each device; enter the same URL/key.
5. Create an account and sign in. Email confirmation may be required by project settings.
6. Export backups on both devices. On the canonical device, click Upload local snapshot; on the other, Download cloud snapshot.
7. After edits, sync manually. This is full-snapshot sync, not record-level merge or automatic background sync. Upload overwrites the cloud snapshot and download overwrites local data. Avoid simultaneous changes on two devices.

## Important limitations
- This is a client-side PWA, not a native Android APK. Use Chrome on Android → menu → Add to Home screen / Install app.
- App data stays in the current browser's localStorage unless cloud sync is enabled. Clearing browser/site data can erase local records.
- Service worker caches the app shell, not user data. Export backups regularly.
- Notifications/reminders while the app is closed are not implemented in this release.
- The optional Supabase library is loaded from a CDN when online; the rest of local features should continue to work when it is unavailable, but sync requires internet.
- Review code and test with a backup before depending on it for important records.
