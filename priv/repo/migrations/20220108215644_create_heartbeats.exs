defmodule IotHeartbeat.Repo.Migrations.CreateHeartbeats do
  use Ecto.Migration

  def change do
    create table(:heartbeats) do
      add :sensor_value, :integer
      add :sensor_serial, references(:sensors, column: :serial, type: :string)

      timestamps()
    end

    create index(:heartbeats, ["inserted_at DESC"])
  end
end
