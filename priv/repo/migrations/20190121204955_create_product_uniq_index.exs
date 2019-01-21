defmodule ElixirMongo.Repo.Migrations.CreateProductUniqIndex do
  use Ecto.Migration

  def change do
    create unique_index(:products, [:sku], name: :products_sku_index)
  end
end
