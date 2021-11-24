defmodule Gestao.Financeiro do
  @moduledoc """
  The Financeiro context.
  """

  import Ecto.Query, warn: false
  alias Gestao.Repo

  alias Gestao.Financeiro.Receita

  @doc """
  Returns the list of receitas.

  ## Examples

      iex> list_receitas()
      [%Receita{}, ...]

  """
  def list_receitas do
    Repo.all(Receita)
  end

  @doc """
  Gets a single receita.

  Raises `Ecto.NoResultsError` if the Receita does not exist.

  ## Examples

      iex> get_receita!(123)
      %Receita{}

      iex> get_receita!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receita!(id), do: Repo.get!(Receita, id)

  @doc """
  Creates a receita.

  ## Examples

      iex> create_receita(%{field: value})
      {:ok, %Receita{}}

      iex> create_receita(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receita(attrs \\ %{}) do
    %Receita{}
    |> Receita.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receita.

  ## Examples

      iex> update_receita(receita, %{field: new_value})
      {:ok, %Receita{}}

      iex> update_receita(receita, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receita(%Receita{} = receita, attrs) do
    receita
    |> Receita.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receita.

  ## Examples

      iex> delete_receita(receita)
      {:ok, %Receita{}}

      iex> delete_receita(receita)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receita(%Receita{} = receita) do
    Repo.delete(receita)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receita changes.

  ## Examples

      iex> change_receita(receita)
      %Ecto.Changeset{data: %Receita{}}

  """
  def change_receita(%Receita{} = receita, attrs \\ %{}) do
    Receita.changeset(receita, attrs)
  end

  alias Gestao.Financeiro.Despesa

  @doc """
  Returns the list of despesas.

  ## Examples

      iex> list_despesas()
      [%Despesa{}, ...]

  """
  def list_despesas do
    Repo.all(Despesa)
  end

  @doc """
  Gets a single despesa.

  Raises `Ecto.NoResultsError` if the Despesa does not exist.

  ## Examples

      iex> get_despesa!(123)
      %Despesa{}

      iex> get_despesa!(456)
      ** (Ecto.NoResultsError)

  """
  def get_despesa!(id), do: Repo.get!(Despesa, id)

  @doc """
  Creates a despesa.

  ## Examples

      iex> create_despesa(%{field: value})
      {:ok, %Despesa{}}

      iex> create_despesa(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_despesa(attrs \\ %{}) do
    %Despesa{}
    |> Despesa.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a despesa.

  ## Examples

      iex> update_despesa(despesa, %{field: new_value})
      {:ok, %Despesa{}}

      iex> update_despesa(despesa, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_despesa(%Despesa{} = despesa, attrs) do
    despesa
    |> Despesa.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a despesa.

  ## Examples

      iex> delete_despesa(despesa)
      {:ok, %Despesa{}}

      iex> delete_despesa(despesa)
      {:error, %Ecto.Changeset{}}

  """
  def delete_despesa(%Despesa{} = despesa) do
    Repo.delete(despesa)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking despesa changes.

  ## Examples

      iex> change_despesa(despesa)
      %Ecto.Changeset{data: %Despesa{}}

  """
  def change_despesa(%Despesa{} = despesa, attrs \\ %{}) do
    Despesa.changeset(despesa, attrs)
  end
end
