defmodule IotHeartbeatWeb.HeartbeatLive do
  use IotHeartbeatWeb, :live_view
  alias IotHeartbeat.{Heartbeats, Sensors}

  @topic inspect(__MODULE__)

  @impl true
  def mount(_params, _session, socket) do
    Heartbeats.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_info({Heartbeats, [:heartbeat, :new], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, heartbeats: Heartbeats.live_heartbeats())
  end
end
