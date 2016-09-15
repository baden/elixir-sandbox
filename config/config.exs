# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sandbox,
  ecto_repos: [Sandbox.Repo]

# Configures the endpoint
config :sandbox, Sandbox.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "jWbrJbmPmUMXq5OnetyH/n7FZ9NqvydTdc+htGpxy+cG20/oawv8PRQpI09KCbL2",
  render_errors: [view: Sandbox.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sandbox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
