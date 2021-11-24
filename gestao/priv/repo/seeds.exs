# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Gestao.Repo.insert!(%Gestao.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Gestao.Repo
alias Gestao.Financas.Tipo

Repo.insert! ((%Tipo{nome: "Contas"}))
Repo.insert! ((%Tipo{nome: "Mercado"}))
Repo.insert! ((%Tipo{nome: "Lazer"}))
Repo.insert! ((%Tipo{nome: "Transporte"}))
Repo.insert! ((%Tipo{nome: "Viagem"}))
Repo.insert! ((%Tipo{nome: "Doação"}))
Repo.insert! ((%Tipo{nome: "Outros"}))
