import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :pbkdf2_elixir, :rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :gestao, Gestao.Repo,
  username: "postgres",
  password: "123456",
  database: "gestao_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gestao, GestaoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "suJXXrns4KYxY6kb6Xv3h3Z4rhSOD1pXBj9CWf7iEhUvl/vnCZmc8g6WZafwF6+G",
  server: false

# In test we don't send emails.
config :gestao, Gestao.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
