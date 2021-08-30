# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixer_api,
       ecto_repos: [PhoenixerApi.Repo]

# Configures the endpoint
config :phoenixer_api,
       PhoenixerApiWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "z0N9JlcBE6iMux3a6vW++8v8dRr56IOywWoZWtrGRy1qkpY9kpK86f+1ImgBOacK",
       render_errors: [
         view: PhoenixerApiWeb.ErrorView,
         accepts: ~w(html json),
         layout: false
       ],
       pubsub_server: PhoenixerApi.PubSub,
       live_view: [
         signing_salt: "NgBr/qE5"
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenixer_api,
       PhoenixerApi.Guardian,
       issuer: "phoenixer_api",
       secret_key: "uOxITNznfiRYjMoGiH7X2n27+Mp8cuPW8FQmgjOI9IXpQq0Pdbo2F5dXJ7zFTs51"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
