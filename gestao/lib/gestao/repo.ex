defmodule Gestao.Repo do
  use Ecto.Repo,
    otp_app: :gestao,
    adapter: Ecto.Adapters.Postgres
end
