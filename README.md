# IotHeartbeat

To start the heartbeat server:

  * Ensure Elixir and Erlang are installed. I used Elixir 1.12.3 and Erlang/OTP 24.
  * Install hex: `mix local.hex` and Phoenix: `mix archive.install hex phx_new`
  * Install heartbeat server dependencies with `mix deps.get`
  * Bring up postgres database with `docker compose up -d`
  * Create, migrate, and seed the database with `mix ecto.setup`. The database can be reset with `mix ecto.reset`.
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To run the test script:

  * Build test script with `make`
  * Run test script with `./test_script`
