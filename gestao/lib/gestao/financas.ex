defmodule Gestao.Financas do
  @moduledoc """
  The Financas context.
  """

  import Ecto.Query, warn: false
  alias Gestao.Repo

  alias Gestao.Financas.Tipo

  @doc """
  Returns the list of tipos.

  ## Examples

      iex> list_tipos()
      [%Tipo{}, ...]

  """
  def list_tipos do
    Repo.all(Tipo)
  end

  @doc """
  Gets a single tipo.

  Raises `Ecto.NoResultsError` if the Tipo does not exist.

  ## Examples

      iex> get_tipo!(123)
      %Tipo{}

      iex> get_tipo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tipo!(id), do: Repo.get!(Tipo, id)

  @doc """
  Creates a tipo.

  ## Examples

      iex> create_tipo(%{field: value})
      {:ok, %Tipo{}}

      iex> create_tipo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tipo(attrs \\ %{}) do
    %Tipo{}
    |> Tipo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tipo.

  ## Examples

      iex> update_tipo(tipo, %{field: new_value})
      {:ok, %Tipo{}}

      iex> update_tipo(tipo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tipo(%Tipo{} = tipo, attrs) do
    tipo
    |> Tipo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tipo.

  ## Examples

      iex> delete_tipo(tipo)
      {:ok, %Tipo{}}

      iex> delete_tipo(tipo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tipo(%Tipo{} = tipo) do
    Repo.delete(tipo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tipo changes.

  ## Examples

      iex> change_tipo(tipo)
      %Ecto.Changeset{data: %Tipo{}}

  """
  def change_tipo(%Tipo{} = tipo, attrs \\ %{}) do
    Tipo.changeset(tipo, attrs)
  end
end
