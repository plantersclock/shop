defmodule Project.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :inventory, :integer
      add :cost, :float

      timestamps()
    end
  end
end
