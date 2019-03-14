defmodule Project.Repo.Migrations.CreateBrands do
  use Ecto.Migration

  def change do
    create table(:brands) do
      add :name, :string

      timestamps()
    end

    alter table(:items) do
      add :brand_id, references(:brands), null: false
    end
  end
end
