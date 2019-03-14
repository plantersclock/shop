defmodule Project.Items do
    alias Project.Item
    alias Project.Repo

    def create_item(attrs) do
        %Item{}
        |> Item.changeset(attrs)
        |> Repo.insert()
    end

    def delete_item(id) do
        Item
        |> Repo.get(id)
        |> Repo.delete()
    end

    def update_item(id, attrs) do
        Item
        |> Repo.get(id)
        |> Item.changeset(attrs)
        |> Repo.update()
    end
end
