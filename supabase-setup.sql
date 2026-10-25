-- Run in Supabase SQL Editor for optional manual snapshot sync.
-- Use only your project's public anon/publishable key in LifeOS. Never use service_role.
create table if not exists public.lifeos_snapshots (
 user_id uuid primary key references auth.users(id) on delete cascade,
 payload jsonb not null,
 updated_at timestamptz not null default now()
);
alter table public.lifeos_snapshots enable row level security;
drop policy if exists "LifeOS users read own snapshot" on public.lifeos_snapshots;
create policy "LifeOS users read own snapshot" on public.lifeos_snapshots for select to authenticated using (auth.uid() = user_id);
drop policy if exists "LifeOS users insert own snapshot" on public.lifeos_snapshots;
create policy "LifeOS users insert own snapshot" on public.lifeos_snapshots for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "LifeOS users update own snapshot" on public.lifeos_snapshots;
create policy "LifeOS users update own snapshot" on public.lifeos_snapshots for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
