defmodule Sandbox.Player do
  defstruct [
    name: "noname",
    character: %Sandbox.Player.Character{},
    position: %{
      world: :lobby,
      x: 0,
      y: 0
    }
  ]


  def player_command(server, player_id, player, {:walk, :east}) do
    :erlang.send_after(500, server, {:tbd, player_id, player})

  end

end
