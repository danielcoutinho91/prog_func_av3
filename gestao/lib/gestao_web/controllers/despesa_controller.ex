defmodule GestaoWeb.DespesaController do
  import GestaoWeb.UsuarioAuth
  use GestaoWeb, :controller

  alias Gestao.Financeiro
  alias Gestao.Financeiro.Despesa

  plug :require_authenticated_usuario

  def index(conn, _params) do
    despesas = Financeiro.list_despesas()
    render(conn, "index.html", despesas: despesas)
  end

  def new(conn, _params) do
    changeset = Financeiro.change_despesa(%Despesa{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"despesa" => despesa_params}) do
    case Financeiro.create_despesa(despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa created successfully.")
        |> redirect(to: Routes.despesa_path(conn, :show, despesa))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesa = Financeiro.get_despesa!(id)
    render(conn, "show.html", despesa: despesa)
  end

  def edit(conn, %{"id" => id}) do
    despesa = Financeiro.get_despesa!(id)
    changeset = Financeiro.change_despesa(despesa)
    render(conn, "edit.html", despesa: despesa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesa" => despesa_params}) do
    despesa = Financeiro.get_despesa!(id)

    case Financeiro.update_despesa(despesa, despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa updated successfully.")
        |> redirect(to: Routes.despesa_path(conn, :show, despesa))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", despesa: despesa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesa = Financeiro.get_despesa!(id)
    {:ok, _despesa} = Financeiro.delete_despesa(despesa)

    conn
    |> put_flash(:info, "Despesa deleted successfully.")
    |> redirect(to: Routes.despesa_path(conn, :index))
  end
end
