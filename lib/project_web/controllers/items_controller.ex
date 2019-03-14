defmodule ProjectWeb.ItemsController do
  use ProjectWeb, :controller

  alias Project.Item
  alias Project.Items
  alias Project.Repo
  alias Project.Brands.Brand

  import Ecto.Query

  def index(conn, params) do
    items = case params["brand_id"] do
      nil -> Repo.all(Item)
      brand_id -> Repo.all(from i in Item, where: i.brand_id == ^brand_id)
    end

    render(conn, "index.html", items: Repo.preload(items, :brand))
  end

  def new(conn, _params) do
    changeset =
      %Item{}
      |>Item.changeset

    # brands = Repo.all(Brand)
    # brand_options = Enum.map(brands, &brand_to_option/1)
    brand_options =
      Brand
      |> Repo.all
      |> Enum.map(fn brand -> {brand.name, brand.id} end)

    render(conn, "new.html", changeset: changeset, brand_options: brand_options)
  end

  def create(conn, %{"item" => item}) do
    Items.create_item(item)
    redirect(conn, to: "/items")
  end

  def delete(conn, %{"id" => id}) do
    Items.delete_item(id)
    redirect(conn, to: "/items")
  end

  defp brand_to_option(brand) do
    {brand.name, brand.id}
  end
end
