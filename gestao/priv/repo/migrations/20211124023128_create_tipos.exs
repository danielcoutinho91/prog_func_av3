defmodule Gestao.Repo.Migrations.CreateTipos do
  use Ecto.Migration

  def change do
    create table(:tipos) do
      add :nome, :string

      timestamps()
    end
    create unique_index(:tipos, [:nome], name: :nome_index)
  end
end
