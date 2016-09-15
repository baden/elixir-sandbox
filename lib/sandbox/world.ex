defmodule Sandbox.World do
  require Logger

  defstruct [
    name: "noname",
    players: []
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

end
