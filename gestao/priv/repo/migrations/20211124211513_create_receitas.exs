defmodule Gestao.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :nome, :string
      add :valor, :float
      add :data, :date

      timestamps()
    end
  end
end
