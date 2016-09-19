defmodule Sandbox do
  use Application

  def start(:normal, args) do
    IO.puts "Starting Sandbox with params: #{inspect args}"
    import Supervisor.Spec, warn: false

    children = [
      # Start the Ecto repository
      supervisor(Sandbox.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Sandbox.Endpoint, []),
      # Start your own worker by calling: Sandbox.Worker.start_link(arg1, arg2, arg3)
      worker(Sandbox.Client.IdServer, []),
      worker(Sandbox.GameServer, [])
    ]
    opts = [strategy: :one_for_one, name: Sandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Sandbox.Endpoint.config_change(changed, removed)
    :ok
  end
end
