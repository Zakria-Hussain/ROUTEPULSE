# Vercel deployment

1. Push this repository to GitHub.
2. Import the repository in Vercel.
3. In Project Settings → Environment Variables add `DATABASE_URL` (the Neon connection string) and `JWT_SECRET` (a long random value) for Production, Preview, and Development as needed.
4. Deploy. Next.js App Router requires no custom server setting.
5. From a local machine, using the same Neon `DATABASE_URL`, run `npm run db:setup` once. This resets and seeds the database.
6. Open the deployed link and test the passenger search, driver simulator, and operator dashboard.
7. Optional CLI: `npm i -g vercel`, `vercel`, `vercel --prod`.

The project does not use runtime filesystem writes, WebSockets, server timers, SQLite, or hardcoded secrets. Live data is served by dynamic JSON endpoints and polled by browsers.
