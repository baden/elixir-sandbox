defmodule Sandbox do
  use Application

  def start(:normal, args) do
    IO.puts "Starting Sandbox with params: #{inspect args}"
    import Supervisor.Spec, warn: false

    children = [
      worker(Sandbox.GameServer, [])
    ]
    opts = [strategy: :one_for_one, name: Sandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  # def config_change(changed, _new, removed) do
  #   Sandbox.Endpoint.config_change(changed, removed)
  #   :ok
  # end
end
