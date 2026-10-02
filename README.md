# RoutePulse — Smart Public Transport & Bus Tracking

A Vercel-ready Next.js platform for passengers, drivers, and transport operators. The core flow is real: search a route, watch a moving bus, calculate ETA, send driver locations, complete trips, and review analytics.

## Features
- Passenger route search with direct-route and transfer suggestions.
- OpenStreetMap/Leaflet live map with moving bus markers, ETA, stop sequence, simulated badge, and stale-location handling.
- Driver mobile workflow with browser-side simulated GPS posting to the same location endpoint every 2 seconds.
- Operator monitor, service alert publishing, trip metrics, peak-hour charts, and performance insight.
- JWT httpOnly cookie authentication and role-aware workspaces.

## Demo accounts
All passwords are `demo1234`: `passenger@demo.com`, `driver1@demo.com`, `operator@demo.com`, `admin@demo.com`.

## Local setup
1. Create a Neon Postgres database and copy its connection string.
2. `cp .env.example .env.local`; set `DATABASE_URL` and `JWT_SECRET`.
3. `npm install && npm run db:setup && npm run dev`
4. Open http://localhost:3000.

## Demo script
1. Passenger: search Central Station → University Gate and select Route 05.
2. Second tab: log in as driver1, choose Route 05, click **Start Trip with Simulated GPS**.
3. Return to passenger: the bus marker and ETA update every 2 seconds. The `SIMULATED GPS` badge is intentional.
4. Trigger a traffic delay or crowd event from the driver panel and observe the operator state.
5. Open operator and review live monitor, charts, and insight.

## How simulation works
The simulator runs in the browser, interpolates ten points between each ordered stop, and POSTs each point to `/api/trips/[id]/location`. The driver/operator tab must remain open. Real phone GPS can use the same endpoint contract with `navigator.geolocation.watchPosition`.

## Known limitations
This intentionally uses 2-second HTTP polling instead of WebSockets. The included Demo Mode button is a guided notice; for the most reliable recording, run the driver simulator in one tab and passenger/operator in another.
