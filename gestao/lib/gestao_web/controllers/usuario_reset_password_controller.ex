defmodule GestaoWeb.UsuarioResetPasswordController do
  use GestaoWeb, :controller

  alias Gestao.Contas

  plug :get_usuario_by_reset_password_token when action in [:edit, :update]

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"usuario" => %{"email" => email}}) do
    if usuario = Contas.get_usuario_by_email(email) do
      Contas.deliver_usuario_reset_password_instructions(
        usuario,
        &Routes.usuario_reset_password_url(conn, :edit, &1)
      )
    end

    # In order to prevent user enumeration attacks, regardless of the outcome, show an impartial success/error message.
    conn
    |> put_flash(
      :info,
      "Se o seu email estiver em nosso sistema, você receberá instruções para resetar sua senha em breve."
    )
    |> redirect(to: "/")
  end

  def edit(conn, _params) do
    render(conn, "edit.html", changeset: Contas.change_usuario_password(conn.assigns.usuario))
  end

  # Do not log in the usuario after reset password to avoid a
  # leaked token giving the usuario access to the account.
  def update(conn, %{"usuario" => usuario_params}) do
    case Contas.reset_usuario_password(conn.assigns.usuario, usuario_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Senha resetada com sucesso.")
        |> redirect(to: Routes.usuario_session_path(conn, :new))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  defp get_usuario_by_reset_password_token(conn, _opts) do
    %{"token" => token} = conn.params

    if usuario = Contas.get_usuario_by_reset_password_token(token) do
      conn |> assign(:usuario, usuario) |> assign(:token, token)
    else
      conn
      |> put_flash(:error, "Link para resetar senha é inválido ou expirou.")
      |> redirect(to: "/")
      |> halt()
    end
  end
end
