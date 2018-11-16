defmodule ElixirMongo.Product do
  @moduledoc """
    
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "products" do
    field :description, :string
    field :name, :string
    field :price, :float
    field :quantity, :integer
    field :sku, :string

    timestamps()
  end

  @doc """
    >
  """
  def changeset(products, attrs) do
    products
    |> cast(attrs, [:sku, :name, :description, :quantity, :price])
    |> validate_required([:sku, :name, :description, :quantity, :price])
    |> unique_constraint(:sku)
  end
end