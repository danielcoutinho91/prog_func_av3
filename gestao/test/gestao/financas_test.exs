defmodule Gestao.FinancasTest do
  use Gestao.DataCase

  alias Gestao.Financas

  describe "tipos" do
    alias Gestao.Financas.Tipo

    import Gestao.FinancasFixtures

    @invalid_attrs %{nome: nil}

    test "list_tipos/0 returns all tipos" do
      tipo = tipo_fixture()
      assert Financas.list_tipos() == [tipo]
    end

    test "get_tipo!/1 returns the tipo with given id" do
      tipo = tipo_fixture()
      assert Financas.get_tipo!(tipo.id) == tipo
    end

    test "create_tipo/1 with valid data creates a tipo" do
      valid_attrs = %{nome: "some nome"}

      assert {:ok, %Tipo{} = tipo} = Financas.create_tipo(valid_attrs)
      assert tipo.nome == "some nome"
    end

    test "create_tipo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financas.create_tipo(@invalid_attrs)
    end

    test "update_tipo/2 with valid data updates the tipo" do
      tipo = tipo_fixture()
      update_attrs = %{nome: "some updated nome"}

      assert {:ok, %Tipo{} = tipo} = Financas.update_tipo(tipo, update_attrs)
      assert tipo.nome == "some updated nome"
    end

    test "update_tipo/2 with invalid data returns error changeset" do
      tipo = tipo_fixture()
      assert {:error, %Ecto.Changeset{}} = Financas.update_tipo(tipo, @invalid_attrs)
      assert tipo == Financas.get_tipo!(tipo.id)
    end

    test "delete_tipo/1 deletes the tipo" do
      tipo = tipo_fixture()
      assert {:ok, %Tipo{}} = Financas.delete_tipo(tipo)
      assert_raise Ecto.NoResultsError, fn -> Financas.get_tipo!(tipo.id) end
    end

    test "change_tipo/1 returns a tipo changeset" do
      tipo = tipo_fixture()
      assert %Ecto.Changeset{} = Financas.change_tipo(tipo)
    end
  end
end
