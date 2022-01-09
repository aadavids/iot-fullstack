defmodule IotHeartbeat.Sensors.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensors" do
    field :serial, :string
    has_many :heartbeats, IotHeartbeat.Heartbeats.Heartbeat, foreign_key: :serial

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:serial])
    |> validate_required([:serial])
    |> unique_constraint(:serial, name: "heartbeats_sensor_serial_fkey")
  end
end
