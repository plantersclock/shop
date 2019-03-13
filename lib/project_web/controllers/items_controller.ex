defmodule ProjectWeb.ItemsController do
  use ProjectWeb, :controller

  alias Project.Item
  alias Project.Repo

  def index(conn, _params) do
    items = Repo.all(Item)
    render(conn, "index.html", items: items)
  end

  def new(conn, _params) do
    empty_item = %Item{}
    changeset = Item.changeset(empty_item)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item}) do
    changeset = Item.changeset(%Item{}, item)
    Repo.insert(changeset)
    redirect(conn, to: "/items")
  end

  def delete(conn, %{"id" => id}) do
    Repo.get(Item, id)
    |>Repo.delete()
    redirect(conn, to: "/items")
  end

end
