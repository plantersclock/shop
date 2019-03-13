defmodule Project.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :cost, :float
    field :inventory, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs \\ %{}) do
    item
    |> cast(attrs, [:name, :inventory, :cost])
    |> validate_required([:name, :inventory, :cost])
  end
end
