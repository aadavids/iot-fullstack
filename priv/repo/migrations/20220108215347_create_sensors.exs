defmodule IotHeartbeat.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :serial, :string

      timestamps()
    end

    create unique_index(:sensors, [:serial])
  end
end
