defmodule IotHeartbeat.Heartbeats.Heartbeat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "heartbeats" do
    field :sensor_value, :integer

    belongs_to :sensor, IotHeartbeat.Sensors.Sensor,
      foreign_key: :sensor_serial,
      type: :string,
      references: :serial

    timestamps()
  end

  @doc false
  def changeset(heartbeat, attrs) do
    heartbeat
    |> cast(attrs, [:sensor_value, :sensor_serial])
    |> validate_required([:sensor_value, :sensor_serial])
  end
end
