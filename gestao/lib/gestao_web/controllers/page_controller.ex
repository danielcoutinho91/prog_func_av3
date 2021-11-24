defmodule GestaoWeb.PageController do
  use GestaoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
