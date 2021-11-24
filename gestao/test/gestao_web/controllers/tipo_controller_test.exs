defmodule GestaoWeb.TipoControllerTest do
  use GestaoWeb.ConnCase

  import Gestao.FinancasFixtures

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  describe "index" do
    test "lists all tipos", %{conn: conn} do
      conn = get(conn, Routes.tipo_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tipos"
    end
  end

  describe "new tipo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tipo_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tipo"
    end
  end

  describe "create tipo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tipo_path(conn, :create), tipo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tipo_path(conn, :show, id)

      conn = get(conn, Routes.tipo_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tipo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tipo_path(conn, :create), tipo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tipo"
    end
  end

  describe "edit tipo" do
    setup [:create_tipo]

    test "renders form for editing chosen tipo", %{conn: conn, tipo: tipo} do
      conn = get(conn, Routes.tipo_path(conn, :edit, tipo))
      assert html_response(conn, 200) =~ "Edit Tipo"
    end
  end

  describe "update tipo" do
    setup [:create_tipo]

    test "redirects when data is valid", %{conn: conn, tipo: tipo} do
      conn = put(conn, Routes.tipo_path(conn, :update, tipo), tipo: @update_attrs)
      assert redirected_to(conn) == Routes.tipo_path(conn, :show, tipo)

      conn = get(conn, Routes.tipo_path(conn, :show, tipo))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, tipo: tipo} do
      conn = put(conn, Routes.tipo_path(conn, :update, tipo), tipo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tipo"
    end
  end

  describe "delete tipo" do
    setup [:create_tipo]

    test "deletes chosen tipo", %{conn: conn, tipo: tipo} do
      conn = delete(conn, Routes.tipo_path(conn, :delete, tipo))
      assert redirected_to(conn) == Routes.tipo_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.tipo_path(conn, :show, tipo))
      end
    end
  end

  defp create_tipo(_) do
    tipo = tipo_fixture()
    %{tipo: tipo}
  end
end
