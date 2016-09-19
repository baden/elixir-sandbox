defmodule Sandbox.World do
  require Logger

  defstruct [
    name: "noname",
    players: %{},
    land: %{}
  ]

  @doc """
    Add Player to World
  """
  def add_player(world, player_id, player) do
    Logger.info("World: add player #{inspect player}")
    # %{world | players: [player | world.players]}
    %{world | players: Map.put(world.players, player_id, player)}
  end

  def player_command(server, world, player_id, {:walk, :east}) do
    player = world.players[player_id]
    Sandbox.Player.player_command(server, player_id, player, {:walk, :east})
    Logger.warn("World: player '#{player.name}' want walk to east (>)")
    # %{world | players: [player | world.players]}
    # %{world | players: Map.put(world.players, player_id, player)}
    # Not fix world yet
    world
  end

  # TODO: Fake and dirty method
  def player_move_to_east(world, player_id, player) do
    players = world.players
    new_player_position = %{player.position | x: player.position.x+1}
    Logger.warn("===? new_player_position = #{inspect new_player_position}")
    new_player_state = %{player | position: new_player_position}
    new_players = %{players | player_id => new_player_state}
    %{world | players: new_players}
  end

  @doc ~S"""
  ## Examples
    iex> Sandbox.World.set_name(%Sandbox.World{}, "foo")
    %Sandbox.World{name: "foo"}

  """
  def set_name(world, name) do
    %{world | name: name}
  end

  @doc """
    Add Item to World
  """
  def add_item(world, item, position) do
    Logger.info("World: add item #{inspect item} to #{inspect position}")
    landbefore = Map.get(world.land, position, [])
    Logger.info("landbefore =  #{inspect landbefore}")
    # landafter = MapSet.put(landbefore, item)
    landafter = [item | landbefore]
    %{world | land: Map.put(world.land, position, landafter)}
  end

  def players_count(world) do
    players = world.players |> Map.keys |> Enum.count
  end

  @doc """
    Add Item to World
  """
  def land(world, position) do
    Map.get(world.land, position, [])
    # |> MapSet.to_list
  end

  defimpl Inspect do
    import Inspect.Algebra

    def inspect(set, opts) do
      # players = set.players |> Map.keys |> Enum.count |> to_string
      players = set |> Sandbox.World.players_count |> to_string
      concat ["#World<", set.name, " players:", players, ">"]
    end
  end
end
