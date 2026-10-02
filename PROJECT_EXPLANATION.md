# Project explanation

## Architecture
```
Passenger Web App -> Next.js API (Vercel) -> Route & Trip Manager
                                      -> Live Location Service <- Driver Mobile GPS / Simulator
                                      -> Postgres (Neon) -> Operator Dashboard
```

## Important folders
- `app/` — App Router pages and serverless route handlers.
- `components/TransitMap.js` — client-only Leaflet map using OpenStreetMap tiles.
- `components/Shell.js` — shared authenticated workspace chrome.
- `lib/db.js` — parameterized Neon SQL helper.
- `lib/auth.js` — bcrypt password verification, jose JWTs, httpOnly cookie, role enforcement.
- `lib/geo.js`, `lib/eta.js` — haversine distance and ETA calculation.
- `lib/simulator.js` — dense interpolated stop-to-stop path.
- `db/schema.sql`, `scripts/setup-db.mjs` — resettable schema and realistic seed.

## Data flow
A driver starts a trip. The API creates an Active trip, marks the bus On Route, and records whether it is simulated. Every simulator tick or real GPS update calls the same location handler. That handler validates coordinates, determines the nearest upcoming stop, updates speed and `last_update`, and leaves the latest position in Postgres. Passenger and operator clients poll `/api/live` every two seconds. The API calculates ETA from the next stop, remaining stop-to-stop distances, current speed (or 25 km/h default), and delay minutes. Markers render from the latest response; stale positions are withheld after 15 seconds.

## Database connection
Neon is accessed with `@neondatabase/serverless` through `lib/db.js`. There is no ORM, filesystem runtime state, SQLite, WebSocket, or custom server. Every API handler is dynamic and uses parameterized SQL. Vercel can therefore execute the handlers as short-lived functions.
