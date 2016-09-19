defmodule Sandbox.GameServer do
  require Logger
  use GenServer
  alias Sandbox.World
  import Sandbox.Gettext

  @interval 1000

  def start_link() do
    # Gettext.put_locale Sandbox.Gettext, "ru"
    Logger.info(gettext "Starting GameServer...")
    # spawn_link(fn -> schedule_tick end)
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    # :ets.insert(:appstats, {sensorid, 0, 0, 0})
    # :erlang.send_after(10000, self, {:sync, sensorid})
    {:ok, %World{}}
  end

  def get_game do
    GenServer.call(__MODULE__, :get_game)
  end

  def handle_call(:get_game, _from, world) do
    {:reply, world, world}
  end

  def add_player(player_id, player) do
    GenServer.cast(__MODULE__, {:add_player, player_id, player})
  end

  def handle_cast({:add_player, player_id, player}, world) do
    {:noreply, World.add_player(world, player_id, player)}
  end

  def player_command(player_id, command) do
    GenServer.cast(__MODULE__, {:player_command, player_id, command})
  end

  def handle_cast({:player_command, player_id, command}, world) do
    {:noreply, World.player_command(self, world, player_id, command)}
  end

  def handle_info({:player_move, direction, player_id}, world) do
    # IO.puts "\n***** Gameserver.handle_info({:tbd, #{inspect player}})\n"
    new_world = World.player_move_to(world, player_id, direction)
    {:noreply, new_world}
  end

  defp schedule_tick do
    :timer.sleep(@interval)
    # IO.puts "Tick"
    # Logger.info("Tick")
    game = %{foo: :bar, baz: :tbd}
    # Sandbox.Endpoint.broadcast! "room:lobby", "update", game
    Sandbox.Endpoint.broadcast! "room:lobby", "new_msg", game
    schedule_tick
  end
end
