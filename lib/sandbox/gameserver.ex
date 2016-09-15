defmodule Sandbox.GameServer do
  require Logger
  use GenServer
  alias Sandbox.World

  @interval 1000

  def start_link() do
    Logger.info("Starting GameServer...")
    spawn_link(fn -> schedule_tick end)
    {:ok, _pid} = Agent.start_link(fn -> %World{} end, name: __MODULE__)
  end

  def get_game do
    Agent.get(__MODULE__, &(&1))
  end

  defp schedule_tick do
    :timer.sleep(@interval)
    # IO.puts "Tick"
    schedule_tick
  end
end
