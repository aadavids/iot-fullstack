defmodule IotHeartbeat.HeartbeatsTest do
  use IotHeartbeat.DataCase

  alias IotHeartbeat.Heartbeats

  describe "heartbeats" do
    alias IotHeartbeat.Heartbeats.Heartbeat

    import IotHeartbeat.HeartbeatsFixtures

    @invalid_attrs %{sensor_value: nil}

    test "list_heartbeats/0 returns all heartbeats" do
      heartbeat = heartbeat_fixture()
      assert Heartbeats.list_heartbeats() == [heartbeat]
    end

    test "get_heartbeat!/1 returns the heartbeat with given id" do
      heartbeat = heartbeat_fixture()
      assert Heartbeats.get_heartbeat!(heartbeat.id) == heartbeat
    end

    test "create_heartbeat/1 with valid data creates a heartbeat" do
      valid_attrs = %{sensor_value: 42}

      assert {:ok, %Heartbeat{} = heartbeat} = Heartbeats.create_heartbeat(valid_attrs)
      assert heartbeat.sensor_value == 42
    end

    test "create_heartbeat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heartbeats.create_heartbeat(@invalid_attrs)
    end

    test "update_heartbeat/2 with valid data updates the heartbeat" do
      heartbeat = heartbeat_fixture()
      update_attrs = %{sensor_value: 43}

      assert {:ok, %Heartbeat{} = heartbeat} = Heartbeats.update_heartbeat(heartbeat, update_attrs)
      assert heartbeat.sensor_value == 43
    end

    test "update_heartbeat/2 with invalid data returns error changeset" do
      heartbeat = heartbeat_fixture()
      assert {:error, %Ecto.Changeset{}} = Heartbeats.update_heartbeat(heartbeat, @invalid_attrs)
      assert heartbeat == Heartbeats.get_heartbeat!(heartbeat.id)
    end

    test "delete_heartbeat/1 deletes the heartbeat" do
      heartbeat = heartbeat_fixture()
      assert {:ok, %Heartbeat{}} = Heartbeats.delete_heartbeat(heartbeat)
      assert_raise Ecto.NoResultsError, fn -> Heartbeats.get_heartbeat!(heartbeat.id) end
    end

    test "change_heartbeat/1 returns a heartbeat changeset" do
      heartbeat = heartbeat_fixture()
      assert %Ecto.Changeset{} = Heartbeats.change_heartbeat(heartbeat)
    end
  end
end
