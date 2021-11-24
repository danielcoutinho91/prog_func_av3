defmodule Gestao.Financeiro.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :data, :date
    field :nome, :string
    field :valor, :float

    timestamps()
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
    |> validate_number(:valor, greater_than: 0)
  end
end
