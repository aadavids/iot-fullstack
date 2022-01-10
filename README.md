# IotHeartbeat

To start the heartbeat server:

  * Install dependencies with `mix deps.get`
  * Bring up postgres database with `docker compose up -d`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

