defmodule Gestao.Repo.Migrations.CreateUsuariosAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:usuarios) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps()
    end

    create unique_index(:usuarios, [:email])

    create table(:usuarios_tokens) do
      add :usuario_id, references(:usuarios, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:usuarios_tokens, [:usuario_id])
    create unique_index(:usuarios_tokens, [:context, :token])
  end
end
