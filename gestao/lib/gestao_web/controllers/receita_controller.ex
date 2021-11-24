defmodule GestaoWeb.ReceitaController do
  import GestaoWeb.UsuarioAuth
  use GestaoWeb, :controller

  alias Gestao.Financeiro
  alias Gestao.Financeiro.Receita

  plug :require_authenticated_usuario

  def index(conn, _params) do
    receitas = Financeiro.list_receitas()
    render(conn, "index.html", receitas: receitas)
  end

  def new(conn, _params) do
    changeset = Financeiro.change_receita(%Receita{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"receita" => receita_params}) do
    case Financeiro.create_receita(receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita created successfully.")
        |> redirect(to: Routes.receita_path(conn, :show, receita))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receita = Financeiro.get_receita!(id)
    render(conn, "show.html", receita: receita)
  end

  def edit(conn, %{"id" => id}) do
    receita = Financeiro.get_receita!(id)
    changeset = Financeiro.change_receita(receita)
    render(conn, "edit.html", receita: receita, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receita" => receita_params}) do
    receita = Financeiro.get_receita!(id)

    case Financeiro.update_receita(receita, receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita updated successfully.")
        |> redirect(to: Routes.receita_path(conn, :show, receita))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Financeiro.get_receita!(id)
    {:ok, _receita} = Financeiro.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deleted successfully.")
    |> redirect(to: Routes.receita_path(conn, :index))
  end
end
