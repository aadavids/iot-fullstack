defmodule IotHeartbeat.HeartbeatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IotHeartbeat.Heartbeats` context.
  """

  @doc """
  Generate a heartbeat.
  """
  def heartbeat_fixture(attrs \\ %{}) do
    {:ok, heartbeat} =
      attrs
      |> Enum.into(%{
        sensor_value: 42
      })
      |> IotHeartbeat.Heartbeats.create_heartbeat()

    heartbeat
  end
end
