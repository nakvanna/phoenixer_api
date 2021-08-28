defmodule PhoenixerApi.Repo do
  use Ecto.Repo,
    otp_app: :phoenixer_api,
    adapter: Ecto.Adapters.Postgres
end
