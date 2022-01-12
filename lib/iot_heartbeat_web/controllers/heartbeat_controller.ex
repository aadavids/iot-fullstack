defmodule IotHeartbeatWeb.HeartbeatController do
  use IotHeartbeatWeb, :controller

  alias IotHeartbeat.Heartbeats
  alias IotHeartbeat.Heartbeats.Heartbeat

  action_fallback IotHeartbeatWeb.FallbackController

  def index(conn, _params) do
    heartbeats = Heartbeats.list_heartbeats()
    render(conn, "index.json", heartbeats: heartbeats)
  end

  def create(conn, %{"heartbeat" => heartbeat_params}) do
    with {:ok, %Heartbeat{} = heartbeat} <- Heartbeats.create_heartbeat(heartbeat_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.heartbeat_path(conn, :show, heartbeat))
      |> render("show.json", heartbeat: heartbeat)
    end
  end

  def show(conn, %{"id" => id}) do
    heartbeat = Heartbeats.get_heartbeat!(id)
    render(conn, "show.json", heartbeat: heartbeat)
  end
end
