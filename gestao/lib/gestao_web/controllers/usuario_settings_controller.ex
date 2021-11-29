defmodule GestaoWeb.UsuarioSettingsController do
  use GestaoWeb, :controller

  alias Gestao.Contas
  alias GestaoWeb.UsuarioAuth

  plug :assign_email_and_password_changesets

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def update(conn, %{"action" => "update_email"} = params) do
    %{"current_password" => password, "usuario" => usuario_params} = params
    usuario = conn.assigns.current_usuario

    case Contas.apply_usuario_email(usuario, password, usuario_params) do
      {:ok, applied_usuario} ->
        Contas.deliver_update_email_instructions(
          applied_usuario,
          usuario.email,
          &Routes.usuario_settings_url(conn, :confirm_email, &1)
        )

        conn
        |> put_flash(
          :info,
          "Um link para confirmar a alteração de email foi enviado para seu novo email."
        )
        |> redirect(to: Routes.usuario_settings_path(conn, :edit))

      {:error, changeset} ->
        render(conn, "edit.html", email_changeset: changeset)
    end
  end

  def update(conn, %{"action" => "update_password"} = params) do
    %{"current_password" => password, "usuario" => usuario_params} = params
    usuario = conn.assigns.current_usuario

    case Contas.update_usuario_password(usuario, password, usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Senha alterada com sucesso!")
        |> put_session(:usuario_return_to, Routes.usuario_settings_path(conn, :edit))
        |> UsuarioAuth.log_in_usuario(usuario)

      {:error, changeset} ->
        render(conn, "edit.html", password_changeset: changeset)
    end
  end

  def confirm_email(conn, %{"token" => token}) do
    case Contas.update_usuario_email(conn.assigns.current_usuario, token) do
      :ok ->
        conn
        |> put_flash(:info, "Email alterado com sucesso!")
        |> redirect(to: Routes.usuario_settings_path(conn, :edit))

      :error ->
        conn
        |> put_flash(:error, "Link para alterar email é inválido ou expirou.")
        |> redirect(to: Routes.usuario_settings_path(conn, :edit))
    end
  end

  defp assign_email_and_password_changesets(conn, _opts) do
    usuario = conn.assigns.current_usuario

    conn
    |> assign(:email_changeset, Contas.change_usuario_email(usuario))
    |> assign(:password_changeset, Contas.change_usuario_password(usuario))
  end
end
