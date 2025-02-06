defmodule TodoappBackend.Repo do
  use Ecto.Repo,
    otp_app: :todoapp_backend,
    adapter: Ecto.Adapters.Postgres
end
