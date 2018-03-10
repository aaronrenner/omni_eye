use Mix.Config

config :eye, port: 4000
config :picam, camera: Picam.FakeCamera

config :logger, level: :debug, utc_log: true

config :logger, :console,
  level: :debug,
  format: "$dateT$time [$level] $message\n"
