defmodule IotHeartbeatWeb.HeartbeatControllerTest do
  use IotHeartbeatWeb.ConnCase

  import IotHeartbeat.SensorsFixtures

  @invalid_attrs %{sensor_value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create heartbeat" do
    test "renders heartbeat when data is valid", %{conn: conn} do
      sensor = sensor_fixture()
      create_attrs = %{sensor_value: 42, sensor_serial: sensor.serial}
      conn = post(conn, Routes.heartbeat_path(conn, :create), heartbeat: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.heartbeat_path(conn, :show, id))

      expected_value = create_attrs.sensor_value
      expected_serial = create_attrs.sensor_serial
      assert %{
               "id" => ^id,
               "sensor_value" => expected_value,
               "sensor_serial" => expected_serial
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.heartbeat_path(conn, :create), heartbeat: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
