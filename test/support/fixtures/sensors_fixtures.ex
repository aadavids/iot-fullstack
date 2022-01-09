defmodule IotHeartbeat.SensorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IotHeartbeat.Sensors` context.
  """

  @doc """
  Generate a sensor.
  """
  def sensor_fixture(attrs \\ %{}) do
    {:ok, sensor} =
      attrs
      |> Enum.into(%{
        serial: "some serial"
      })
      |> IotHeartbeat.Sensors.create_sensor()

    sensor
  end
end
