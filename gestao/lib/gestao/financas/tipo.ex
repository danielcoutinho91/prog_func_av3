defmodule Gestao.Financas.Tipo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tipos" do
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(tipo, attrs) do
    tipo
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end
