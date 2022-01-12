defmodule IotHeartbeat.HeartbeatsTest do
  use IotHeartbeat.DataCase

  alias IotHeartbeat.Heartbeats

  describe "heartbeats" do
    alias IotHeartbeat.Heartbeats.Heartbeat

    import IotHeartbeat.HeartbeatsFixtures
    import IotHeartbeat.SensorsFixtures

    @invalid_attrs %{sensor_value: nil}

    test "list_heartbeats/0 returns all heartbeats" do
      sensor = sensor_fixture()
      heartbeat = heartbeat_fixture(%{sensor_serial: sensor.serial})
      assert Heartbeats.list_heartbeats() == [heartbeat]
    end

    test "get_heartbeat!/1 returns the heartbeat with given id" do
      sensor = sensor_fixture()
      heartbeat = heartbeat_fixture(%{sensor_serial: sensor.serial})
      assert Heartbeats.get_heartbeat!(heartbeat.id) == heartbeat
    end

    test "create_heartbeat/1 with valid data creates a heartbeat and broadcasts a change" do
      # subscribe to heartbeat updates
      IotHeartbeat.Heartbeats.subscribe()

      sensor = sensor_fixture()
      valid_attrs = %{sensor_value: 42, sensor_serial: sensor.serial}

      assert {:ok, %Heartbeat{} = heartbeat} = Heartbeats.create_heartbeat(valid_attrs)
      assert heartbeat.sensor_value == 42

      # assert that we receive a message when a new heartbeat is added
      assert_received({Heartbeats, [:heartbeat, :new], _})
    end

    test "create_heartbeat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heartbeats.create_heartbeat(@invalid_attrs)
    end
  end
end
