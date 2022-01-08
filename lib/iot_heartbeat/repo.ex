defmodule IotHeartbeat.Repo do
  use Ecto.Repo,
    otp_app: :iot_heartbeat,
    adapter: Ecto.Adapters.Postgres
end
