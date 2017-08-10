defmodule Sandbox.Mixfile do
  use Mix.Project

  def project do
    [app: :sandbox,
     version: "0.1.0",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {Sandbox, []},
      applications: [
        :phoenix, :phoenix_pubsub, :phoenix_html, :cowboy,
        :logger, :gettext, :phoenix_ecto, :postgrex
      ]
    ]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:phoenix, "~> 1.3"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     # {:exrm, "~> 1.0.5"}, # Deployment
     #  {:erlware_commons, github: "erlware/erlware_commons", manager: :rebar3, override: true},
     #  {:relx, github: "erlware/relx", tag: "v3.20.0", override: true},

    #  {:cf, "~> 0.2.1", override: true},
    #  {:erlware_commons, github: "erlware/erlware_commons", override: true},
    #  {:exrm, "~> 1.0"}, # Deployment
    # TODO remove this once new version of relx is released
    # https://github.com/bitwalker/exrm/issues/294
    # {:cf, "~> 0.2.1", override: true},
    # {:cf, github: "project-fifo/cf", tag: "0.2.1", override: true},
    {:cf, github: "baden/cf", override: true},
    {:erlware_commons, github: "erlware/erlware_commons", override: true},
    {:providers, github: "tsloughter/providers", override: true},
    {:getopt, github: "jcomellas/getopt", override: true},
    # {:relx, github: "erlware/relx", override: true},
    # {:exrm, "~> 1.0.0-rc8"},

     {:cowboy, "~> 1.0"}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
