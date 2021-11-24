defmodule Gestao.FinanceiroFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gestao.Financeiro` context.
  """

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        data: ~D[2021-11-23],
        nome: "some nome",
        valor: 120.5
      })
      |> Gestao.Financeiro.create_receita()

    receita
  end

  @doc """
  Generate a despesa.
  """
  def despesa_fixture(attrs \\ %{}) do
    {:ok, despesa} =
      attrs
      |> Enum.into(%{
        data: ~D[2021-11-23],
        nome: "some nome",
        valor: 120.5
      })
      |> Gestao.Financeiro.create_despesa()

    despesa
  end
end
