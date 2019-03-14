defmodule Project.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Project.Brands.Brand

  schema "items" do
    field :cost, :float
    field :inventory, :integer
    field :name, :string
    belongs_to(:brand, Brand)
    timestamps()
  end

  @doc false
  def changeset(item, attrs \\ %{}) do
    item
    |> cast(attrs, [:name, :inventory, :cost, :brand_id])
    |> validate_required([:name, :inventory, :cost, :brand_id])
  end
end
