defmodule ElixirMongo.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :sku, :string
      add :name, :string
      add :description, :string
      add :quantity, :integer
      add :price, :float

      timestamps()
    end

  end
end
