defmodule IotHeartbeatWeb.HeartbeatControllerTest do
  use IotHeartbeatWeb.ConnCase

  import IotHeartbeat.HeartbeatsFixtures

  alias IotHeartbeat.Heartbeats.Heartbeat

  @create_attrs %{
    sensor_value: 42
  }
  @update_attrs %{
    sensor_value: 43
  }
  @invalid_attrs %{sensor_value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all heartbeats", %{conn: conn} do
      conn = get(conn, Routes.heartbeat_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create heartbeat" do
    test "renders heartbeat when data is valid", %{conn: conn} do
      conn = post(conn, Routes.heartbeat_path(conn, :create), heartbeat: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.heartbeat_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "sensor_value" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.heartbeat_path(conn, :create), heartbeat: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update heartbeat" do
    setup [:create_heartbeat]

    test "renders heartbeat when data is valid", %{
      conn: conn,
      heartbeat: %Heartbeat{id: id} = heartbeat
    } do
      conn = put(conn, Routes.heartbeat_path(conn, :update, heartbeat), heartbeat: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.heartbeat_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "sensor_value" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, heartbeat: heartbeat} do
      conn = put(conn, Routes.heartbeat_path(conn, :update, heartbeat), heartbeat: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete heartbeat" do
    setup [:create_heartbeat]

    test "deletes chosen heartbeat", %{conn: conn, heartbeat: heartbeat} do
      conn = delete(conn, Routes.heartbeat_path(conn, :delete, heartbeat))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.heartbeat_path(conn, :show, heartbeat))
      end
    end
  end

  defp create_heartbeat(_) do
    heartbeat = heartbeat_fixture()
    %{heartbeat: heartbeat}
  end
end
