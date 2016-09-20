defmodule Sandbox.World do
  require Logger
  import UpdateOperator

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

    # %{world | players: Map.put(world.players, player_id, player)}
    # Map.put(world.players, player_id, player) ~> world.players

    # Cool macro!
    player ~> world.players[player_id]
  end

  def player_command(server, world, player_id, command) do
    players = world.players
    player = players[player_id]
    new_player_state = Sandbox.Player.player_command(server, player_id, player, command)

    # new_players = %{players | player_id => new_player_state}
    # new_players = put_in players[player_id], new_player_state
    new_players = new_player_state ~> players[player_id]

    # Use my cool map update macro
    # %{world | players: new_players}
    new_players ~> world.players
  end

  # TODO: Fake and dirty method
  def player_move_to(world, player_id, direction, server) do
    players = world.players
    player = world.players[player_id]
    # new_player_position = %{player.position | x: player.position.x+1}
    # new_player_state = %{player | position: new_player_position}
    new_player_state = Sandbox.Player.move_to(player, direction)
    # Logger.warn("new #{new_player_state.name} position is #{inspect new_player_state.position}")
    new_players = %{players | player_id => new_player_state}
    # Continue run

    # Not fix state here. May be command is changed before!
    # TODO: Its looks not to good.
    Sandbox.Player.player_command(server, player_id, player, player.command)
    # :erlang.send_after(trunc(1000 / speed), server, {:player_move, direction, player_id})
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
