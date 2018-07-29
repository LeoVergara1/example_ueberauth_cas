# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :example_ueberauth_cas,
  ecto_repos: [ExampleUeberauthCas.Repo]

# Configures the endpoint
config :example_ueberauth_cas, ExampleUeberauthCasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ydq2k15Kckqg8kLJU2AmJ0j/t7Fcv5LImQkO5ASvPoCK59sYuHAHrZmjQ0pWo3m5",
  render_errors: [view: ExampleUeberauthCasWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExampleUeberauthCas.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    cas: {Ueberauth.Strategy.CAS, [
      base_url: "https://apr-test.ebc.edu.mx/casad",
      callback: "http://localhost:4000/",
  ]}]
