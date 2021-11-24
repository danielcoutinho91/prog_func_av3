defmodule Gestao.FinanceiroTest do
  use Gestao.DataCase

  alias Gestao.Financeiro

  describe "receitas" do
    alias Gestao.Financeiro.Receita

    import Gestao.FinanceiroFixtures

    @invalid_attrs %{data: nil, nome: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Financeiro.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Financeiro.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{data: ~D[2021-11-23], nome: "some nome", valor: 120.5}

      assert {:ok, %Receita{} = receita} = Financeiro.create_receita(valid_attrs)
      assert receita.data == ~D[2021-11-23]
      assert receita.nome == "some nome"
      assert receita.valor == 120.5
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financeiro.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{data: ~D[2021-11-24], nome: "some updated nome", valor: 456.7}

      assert {:ok, %Receita{} = receita} = Financeiro.update_receita(receita, update_attrs)
      assert receita.data == ~D[2021-11-24]
      assert receita.nome == "some updated nome"
      assert receita.valor == 456.7
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Financeiro.update_receita(receita, @invalid_attrs)
      assert receita == Financeiro.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Financeiro.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Financeiro.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Financeiro.change_receita(receita)
    end
  end

  describe "despesas" do
    alias Gestao.Financeiro.Despesa

    import Gestao.FinanceiroFixtures

    @invalid_attrs %{data: nil, nome: nil, valor: nil}

    test "list_despesas/0 returns all despesas" do
      despesa = despesa_fixture()
      assert Financeiro.list_despesas() == [despesa]
    end

    test "get_despesa!/1 returns the despesa with given id" do
      despesa = despesa_fixture()
      assert Financeiro.get_despesa!(despesa.id) == despesa
    end

    test "create_despesa/1 with valid data creates a despesa" do
      valid_attrs = %{data: ~D[2021-11-23], nome: "some nome", valor: 120.5}

      assert {:ok, %Despesa{} = despesa} = Financeiro.create_despesa(valid_attrs)
      assert despesa.data == ~D[2021-11-23]
      assert despesa.nome == "some nome"
      assert despesa.valor == 120.5
    end

    test "create_despesa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financeiro.create_despesa(@invalid_attrs)
    end

    test "update_despesa/2 with valid data updates the despesa" do
      despesa = despesa_fixture()
      update_attrs = %{data: ~D[2021-11-24], nome: "some updated nome", valor: 456.7}

      assert {:ok, %Despesa{} = despesa} = Financeiro.update_despesa(despesa, update_attrs)
      assert despesa.data == ~D[2021-11-24]
      assert despesa.nome == "some updated nome"
      assert despesa.valor == 456.7
    end

    test "update_despesa/2 with invalid data returns error changeset" do
      despesa = despesa_fixture()
      assert {:error, %Ecto.Changeset{}} = Financeiro.update_despesa(despesa, @invalid_attrs)
      assert despesa == Financeiro.get_despesa!(despesa.id)
    end

    test "delete_despesa/1 deletes the despesa" do
      despesa = despesa_fixture()
      assert {:ok, %Despesa{}} = Financeiro.delete_despesa(despesa)
      assert_raise Ecto.NoResultsError, fn -> Financeiro.get_despesa!(despesa.id) end
    end

    test "change_despesa/1 returns a despesa changeset" do
      despesa = despesa_fixture()
      assert %Ecto.Changeset{} = Financeiro.change_despesa(despesa)
    end
  end
end
