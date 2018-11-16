defmodule ElixirMongo.ProductController do
  use ElixirMongo.Web, :controller

  alias ElixirMongo.{ElixirMongo, Product}

  def index(conn, _params) do
    products = ElixirMongo.list_products()

    render(conn, "index.html", products: products)
  end

  def show(conn, %{"id" => id}) do
    product = ElixirMongo.get_product!(id)

    case product do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(ElixirMongo.ErrorView)
        |> render(:"404")

      _ ->
        render(conn, "show.html", product: product)
    end
  end

  def new(conn, _params) do
    changeset = ElixirMongo.change_product(%Product{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    case ElixirMongo.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully!")
        |> redirect(to: product_path(conn, :show, product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    product = ElixirMongo.get_product!(id)
    changeset = ElixirMongo.change_product(product)

    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = ElixirMongo.get_product!(id)

    case ElixirMongo.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated succesfully!")
        |> redirect(to: product_path(conn, :show, product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = ElixirMongo.get_product!(id)

    case ElixirMongo.delete_product(product) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product deleted succesfully!")
        |> redirect(to: product_path(conn, :index))
      {:error, product} ->
        conn
        |> put_flash(:error, "Failed to delete this product!")
        |> redirect(to: product_path(conn, product))
    end
  end
end