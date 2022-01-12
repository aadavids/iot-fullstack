# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IotHeartbeat.Repo.insert!(%IotHeartbeat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
IotHeartbeat.Repo.delete_all(IotHeartbeat.Heartbeats.Heartbeat, [])

IotHeartbeat.Repo.delete_all(IotHeartbeat.Sensors.Sensor, [])

sensor_a = "ab:cd:ef:01:23:45"
sensor_b = "aa:aa:aa:aa:aa:aa"
sensor_c = "11:22:33:44:55:66"

IotHeartbeat.Repo.insert!(%IotHeartbeat.Sensors.Sensor{serial: sensor_a})
IotHeartbeat.Repo.insert!(%IotHeartbeat.Sensors.Sensor{serial: sensor_b})
IotHeartbeat.Repo.insert!(%IotHeartbeat.Sensors.Sensor{serial: sensor_c})

IotHeartbeat.Repo.insert!(%IotHeartbeat.Heartbeats.Heartbeat{
  sensor_value: 1,
  sensor_serial: sensor_a
})

IotHeartbeat.Repo.insert!(%IotHeartbeat.Heartbeats.Heartbeat{
  sensor_value: 2,
  sensor_serial: sensor_a
})

IotHeartbeat.Repo.insert!(%IotHeartbeat.Heartbeats.Heartbeat{
  sensor_value: 3,
  sensor_serial: sensor_a
})

IotHeartbeat.Repo.insert!(%IotHeartbeat.Heartbeats.Heartbeat{
  sensor_value: 4,
  sensor_serial: sensor_a
})

IotHeartbeat.Repo.insert!(%IotHeartbeat.Heartbeats.Heartbeat{
  sensor_value: 1,
  sensor_serial: sensor_b
})

IotHeartbeat.Repo.insert!(%IotHeartbeat.Heartbeats.Heartbeat{
  sensor_value: 1,
  sensor_serial: sensor_c
})
