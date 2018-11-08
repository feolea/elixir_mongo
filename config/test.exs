use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_mongo, ElixirMongo.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_mongo, ElixirMongo.Repo,
  database: "rails_mongo_test",
  hostname: "localhost:27017",
  pool: Ecto.Adapters.SQL.Sandbox
