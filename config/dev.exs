use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :sandbox, Sandbox.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  # cache_static_lookup: false,
  check_origin: false,
  # Hot reload
  watchers: [{Path.expand("webpack.dev.js"), []}]
  # watchers: [
  #   node: ["node_modules/webpack/bin/webpack.js", "--watch", "--color"]
  # ]


# Watch static and templates for browser reloading.
config :sandbox, Sandbox.Endpoint,
  live_reload: [
    patterns: [
      # ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, level: :debug
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :sandbox, Sandbox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "baden",
  password: "333",
  database: "sandbox_dev",
  hostname: "localhost",
  pool_size: 10
