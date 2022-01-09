defmodule IotHeartbeatWeb.HeartbeatLive do
  use IotHeartbeatWeb, :live_view
  alias IotHeartbeat.{Heartbeats, Sensors}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, heartbeats: Heartbeats.list_heartbeats(), sensors: Sensors.list_sensors())}
  end
end
