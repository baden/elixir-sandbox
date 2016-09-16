defmodule Sandbox.World do
  require Logger

  defstruct [
    name: "noname",
    players: [],
    land: %{}
  ]

  @doc """
    Add Player to World
  """
  def add_player(world, player) do
    Logger.info("World: add player #{inspect player}")
    %{world | players: [player | world.players]}
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
      concat ["#World<", set.name, ">"]
    end
  end
end
