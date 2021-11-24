defmodule GestaoWeb.TipoController do
  import GestaoWeb.UsuarioAuth
  use GestaoWeb, :controller

  alias Gestao.Financas
  alias Gestao.Financas.Tipo
  alias GestaoWeb.UsuarioAuth

  plug :fetch_current_usuario
  plug :require_authenticated_usuario

  def index(conn, _params) do
    tipos = Financas.list_tipos()
    IO.puts("0000000000000000000000000000000000000000")
    IO.puts("0000000000000000000000000000000000000000")
    IO.puts("0000000000000000000000000000000000000000")
    IO.puts("0000000000000000000000000000000000000000")
    render(conn, "index.html", tipos: tipos)
  end

  def new(conn, _params) do
    changeset = Financas.change_tipo(%Tipo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tipo" => tipo_params}) do
    case Financas.create_tipo(tipo_params) do
      {:ok, tipo} ->
        conn
        |> put_flash(:info, "Tipo created successfully.")
        |> redirect(to: Routes.tipo_path(conn, :show, tipo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tipo = Financas.get_tipo!(id)
    render(conn, "show.html", tipo: tipo)
  end

  def edit(conn, %{"id" => id}) do
    tipo = Financas.get_tipo!(id)
    changeset = Financas.change_tipo(tipo)
    render(conn, "edit.html", tipo: tipo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tipo" => tipo_params}) do
    tipo = Financas.get_tipo!(id)

    case Financas.update_tipo(tipo, tipo_params) do
      {:ok, tipo} ->
        conn
        |> put_flash(:info, "Tipo updated successfully.")
        |> redirect(to: Routes.tipo_path(conn, :show, tipo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tipo: tipo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tipo = Financas.get_tipo!(id)
    {:ok, _tipo} = Financas.delete_tipo(tipo)

    conn
    |> put_flash(:info, "Tipo deleted successfully.")
    |> redirect(to: Routes.tipo_path(conn, :index))
  end
end
