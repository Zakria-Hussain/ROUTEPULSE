# RoutePulse demo script (3–4 minutes)

**0:00 — Passenger search.** “RoutePulse starts with the passenger. I search Central Station to University Gate and select Route 05. The route card shows duration, stops, and active service.”

**0:35 — Live tracking.** “This is the live map, not a static route page. Buses are polled every two seconds and rendered with OpenStreetMap. Selecting a bus shows its current stop, next stop, and ETA. If the location is stale, the app hides the position rather than showing wrong data.”

**1:05 — Driver workflow.** “In a second mobile-sized tab I sign in as Driver One and start the Route 05 trip. This run uses the browser fallback, so the UI clearly says SIMULATED GPS. The tab stays open and sends interpolated stop-to-stop coordinates to the exact same location endpoint a phone GPS would use.”

**1:45 — ETA and alerts.** “Back on the passenger map, the marker moves and ETA changes. I can report a traffic delay or high crowd level. The service alert is stored in Postgres and becomes visible to riders and operators.”

**2:15 — Operator dashboard.** “The operator sees all active vehicles, delayed status, and a network map. The dashboard includes trips per hour, route delay summaries, and a generated operational insight. This is where a dispatcher can publish a service-wide alert.”

**2:50 — Architecture close.** “The system is designed for Vercel: Neon Postgres, short serverless API handlers, no WebSockets, and browser polling. The driver tab can use real GPS or the labeled simulator, while the passenger and operator views stay in sync.”
