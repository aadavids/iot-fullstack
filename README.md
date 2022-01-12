# IotHeartbeat

To start the heartbeat server:

  * Install dependencies with `mix deps.get`
  * Bring up postgres database with `docker compose up -d`
  * Create and migrate your database with `mix ecto.setup`
  * Seed database with `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To run the test script:

  * Build test script with `make`
  * Run test script with `./test_script`
