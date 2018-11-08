defmodule ElixirMongo.Repo do
  use Ecto.Repo, otp_app: :elixir_mongo, adapter: Mongo.Ecto
end
