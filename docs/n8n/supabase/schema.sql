-- LeadFlow AI
-- Supabase database schema
-- This file documents the database structure used by the MVP.

create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),

  created_at timestamptz not null default now(),

  name text not null,
  email text not null,
  company text,
  message text not null,

  category text,
  subcategory text,
  priority text,
  summary text,
  next_action text,

  status text not null default 'new'
);

-- Enable Row Level Security.
-- Frontend applications must access this table through explicit RLS policies.

alter table public.leads enable row level security;

-- SECURITY NOTE
--
-- The production project uses a restricted SELECT policy so that only
-- the authorized dashboard user can read lead data.
--
-- The real Supabase user UUID is intentionally NOT stored in this repository.
--
-- Example policy structure:
--
-- create policy "admin can read leads"
-- on public.leads
-- as permissive
-- for select
-- to authenticated
-- using (
--   (select auth.uid()) = 'YOUR_ADMIN_USER_UUID'::uuid
-- );
--
-- Replace YOUR_ADMIN_USER_UUID only in the Supabase project configuration.
-- Do not commit real user IDs, passwords, service-role keys,
-- secret keys, or database credentials to the repository.
