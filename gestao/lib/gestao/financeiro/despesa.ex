defmodule Gestao.Financeiro.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :data, :date
    field :nome, :string
    field :valor, :float

    timestamps()
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
    |> validate_number(:valor, greater_than: 0)
  end
end
