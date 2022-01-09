defmodule IotHeartbeatWeb.HeartbeatView do
  use IotHeartbeatWeb, :view
  alias IotHeartbeatWeb.HeartbeatView

  def render("index.json", %{heartbeats: heartbeats}) do
    %{data: render_many(heartbeats, HeartbeatView, "heartbeat.json")}
  end

  def render("show.json", %{heartbeat: heartbeat}) do
    %{data: render_one(heartbeat, HeartbeatView, "heartbeat.json")}
  end

  def render("heartbeat.json", %{heartbeat: heartbeat}) do
    %{
      id: heartbeat.id,
      sensor_value: heartbeat.sensor_value
    }
  end
end
