defmodule Sandbox.PlayerServer do
  require Logger
  use GenServer
  alias Sandbox.Player
  import Sandbox.Gettext


  def start_link() do
    # Gettext.put_locale Sandbox.Gettext, "ru"
    Logger.info(gettext "Starting PlayerServer...")
    # spawn_link(fn -> schedule_tick end)
    {:ok, _pid} = Agent.start_link(fn -> %Player{} end, name: __MODULE__)
  end

  def get_player do
    Agent.get(__MODULE__, &(&1))
  end

end
