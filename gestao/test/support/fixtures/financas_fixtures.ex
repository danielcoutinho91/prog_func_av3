defmodule Gestao.FinancasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gestao.Financas` context.
  """

  @doc """
  Generate a tipo.
  """
  def tipo_fixture(attrs \\ %{}) do
    {:ok, tipo} =
      attrs
      |> Enum.into(%{
        nome: "some nome"
      })
      |> Gestao.Financas.create_tipo()

    tipo
  end
end
