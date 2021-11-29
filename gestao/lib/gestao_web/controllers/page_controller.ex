defmodule GestaoWeb.PageController do
  import GestaoWeb.UsuarioAuth
  use GestaoWeb, :controller

  plug :require_authenticated_usuario

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
