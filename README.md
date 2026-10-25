# Mr.Shadow — Phone-Only Personal Command Center

A personal, free-to-host Progressive Web App for Android. No app-store publishing, cloud database, subscription, or account is required.

## Included features
- Overview dashboard and quick actions.
- Dedicated Toggl tab with eight pinned one-tap activity timers (Sleep, Work, Office, Commute, Study, Idle, Meals, Exercise), editable activities, category/label mapping, and one active timer at a time.
- Per-activity daily minimum targets (for study/work) and maximum limits (for sleep/idle/commute), with progress colors for achieved, below target, and over limit.
- Quick tasks need only a title and target date; optional expandable checklist and details keep task capture lightweight. Checklist items can be checked independently.
- Tasks with dates, priority, categories, projects and filters.
- Calendar with session and task markers.
- Habits, schedules, streaks and historical check-ins.
- Goals, measurable progress and linked tasks/time.
- Searchable notes with tags.
- Reports and CSV export.
- Personal finance: accounts, balances, income, expenses, transfers, budgets and transaction history.
- IndexedDB local database with a best-effort localStorage fallback and migration from earlier Mr.Shadow keys.
- Validated JSON export/restore, CSV export and a Sunday in-app backup reminder.
- Vivid Pulse theme: electric teal, violet, warm gold, high-contrast dark surfaces and subtle glow effects. Motion respects the device's reduced-motion preference.
- Offline app shell and mobile-first layout.

## Free deployment to GitHub Pages
1. **Protect any data in the old app first.** If you have records you want to keep, open the old site and export a JSON backup before replacing the code. Site data is tied to the exact origin/browser; this package does not migrate data from a different origin automatically.
2. Download and extract `MrShadow_Phone_Only.zip`.
3. Open your existing repository: `https://github.com/saisharmac/lifeos`.
4. Select **Add file → Upload files**.
5. Upload/replace these four files from the extracted `MrShadow_Phone_Only` folder: `index.html`, `manifest.webmanifest`, `sw.js`, and `icon.svg`. Upload `README.md` too if you want the repository guide updated. There is no SQL file to run for this phone-only version.
6. Scroll to **Commit changes**. Use a message such as `Deploy Mr.Shadow Pulse phone-only edition` and commit to the branch your Pages site publishes from.
7. Open the repository's **Actions** tab and wait for the Pages build/deployment to finish successfully.
8. On the phone, open `https://saisharmac.github.io/lifeos/` in Chrome. Refresh after deployment. The new service-worker cache is versioned and the app document uses network-first loading, reducing stale-page problems.
9. To install, open Chrome's menu and choose **Add to Home screen** or **Install app**, if offered.

## First-use verification
- Open Mr.Shadow, add a sample task, start and stop a sample timer, and create a sample note.
- Open **Backup & settings → Export JSON backup** and save the downloaded file to Google Drive (or another safe place).
- Test restore only with a disposable/test dataset first. Import asks before replacing local data.
- On Sunday, when you open Mr.Shadow, an in-app reminder appears if you have not exported a backup during the current Sunday week. Tap **Export backup**, then save the downloaded JSON file to Drive.

## How storage and Sunday reminders work
- IndexedDB is the primary structured local store; a best-effort localStorage copy is maintained for recovery/compatibility.
- No cloud sync or Google Drive API integration is included. Google Drive is a place to save the exported backup file; upload the file manually.
- Sunday reminders are in-app reminders shown when Mr.Shadow is opened on Sunday. A web app cannot reliably run a reminder while fully closed without additional notification infrastructure/permissions, so this version does not promise background notifications.
- Clearing Chrome site data can erase local records. Keep dated backups outside the browser and verify that a backup file exists before clearing site data.

## Privacy and cost
- No analytics, remote database, Supabase, Firebase, or third-party JavaScript CDN is used by this phone-only version.
- GitHub Pages hosting and local app use can be free for this personal project, subject to GitHub's terms and usage limits.
- JSON backup files contain personal data, including any finance entries. Keep your Drive account secure and do not share backup files publicly.

## Important limitations
This is a client-side PWA, not a native Android APK. Test all important workflows before relying on it for financial or other critical records. Backups remain your responsibility.


## Mr.Shadow usability refinements
- Signature dark theme with luminous teal, violet and gold accents.
- Phone-first fixed bottom navigation and floating quick-action button.
- Quick action sheet for tasks, focus timer, notes, habits, goals, manual time and calendar.
- Today focus panel and optional daily review with saved reflection.
- Keeps all data local; JSON backups remain manual and portable.

Sunday backup reminders appear when the app is opened on Sunday; they do not send operating-system notifications while the app is closed.


## Toggl one-tap activities
- Tap **Toggl** in the bottom navigation. Tap an activity icon once to start; tap the active activity again to stop. Tap a different activity to confirm switching.
- Edit activities to change icon, color, category, labels, pin state and daily target behavior. Only eight activities can be pinned.
- Minimum targets turn green when achieved and red while still below target. Maximum limits remain green while within the limit and turn amber after exceeding it.
- A timer spanning midnight is saved as separate daily segments so each day receives the correct duration.
- In Tasks, **Quick task** asks only for a title and date. Expand the optional section to add checklist lines, one per line.
