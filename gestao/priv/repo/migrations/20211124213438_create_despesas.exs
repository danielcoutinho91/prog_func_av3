defmodule Gestao.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :nome, :string
      add :valor, :float
      add :data, :date

      timestamps()
    end
  end
end
