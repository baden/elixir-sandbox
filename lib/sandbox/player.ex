defmodule Sandbox.Player do
  require Logger
  defstruct [
    name: "noname",
    character: %Sandbox.Player.Character{},
    position: %{
      world: :lobby,
      x: 0,
      y: 0
    }
  ]

  def player_command(server, player_id, player, {:walk, direction}) do
    speed = player.character.speed
    Logger.warn("World: player '#{player.name}' start walk to #{direction} with speed #{speed}")
    :erlang.send_after(trunc(1000 / speed), server, {:player_move, direction, player_id})
  end

  # def player_walk_to(server, player_id, player, {:walk, :east}) do
  #   # TODO: make a reservation target location
  #
  # end

  def move_to(player, :east) do
    new_player_position = %{player.position | x: player.position.x+1}
    %{player | position: new_player_position}
  end

  def move_to(player, :north) do
    new_player_position = %{player.position | y: player.position.y+1}
    %{player | position: new_player_position}
  end

end
