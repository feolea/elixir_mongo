# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_mongo,
  ecto_repos: [ElixirMongo.Repo]

# Configures the endpoint
config :elixir_mongo, ElixirMongo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IOjk5OOBBpUPbaCeK/qzEcbOyQQe6NLQABVxXnllJJTrPdmLmK8i9EPyHET/uPKL",
  render_errors: [view: ElixirMongo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirMongo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :exredis,
  host: "127.0.0.1",
  port: 6379,
  password: "",
  db: 0,
  reconnect: :no_reconnect,
  max_queue: :infinity
  
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
