defmodule ProjectWeb.PageController do
  use ProjectWeb, :controller

  alias Project.Brands

  def index(conn, _params) do
    brands = Brands.list_brands()
    render(conn, "index.html", brands: brands)
  end
end
