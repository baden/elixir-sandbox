defmodule GameServerTest do
  alias Sandbox.World
  alias Sandbox.Player
  use ExUnit.Case

  test "Create empty world" do
    assert true
  end

  test "Walk player" do
    # {:ok, server} = Sandbox.GameServer.start_link()
    game_before = Sandbox.GameServer.get_game
    IO.puts "\nGame before = #{inspect game_before}"

    player1 = %Player{
      name: "Bob",
      position: %{world: :flat, x:  0, y: 0},
      character: %Sandbox.Player.Character{speed: 1}  # 1 cell for seconds
    }
    player2 = %Player{
      name: "Alice",
      position: %{world: :flat, x: 10, y: 0},
      character: %Sandbox.Player.Character{speed: 2}  # 2 cell for seconds
    }
    Sandbox.GameServer.add_player(0, player1)
    Sandbox.GameServer.add_player(1, player2)

    # Bob want walk to east
    Sandbox.GameServer.player_command(0, {:walk, :east})
    # s1 = World.add_player(s, p)

    # g = Sandbox.GameServer.get_game
    # players = Sandbox.GameServer.players
    game_after = Sandbox.GameServer.get_game

    assert World.players_count(game_after) == 2

    IO.puts "\nGame  after = #{inspect game_after}"

    players = game_after.players
    assert players[0].name == "Bob"
    assert players[0].position.x == 0   # Not moved jet but start walking

    :timer.sleep(1_000)
    game_after2 = Sandbox.GameServer.get_game
    IO.puts "\nGame  after = #{inspect game_after2}"
    assert game_after2.players[0].position.x == 1   # Wow, he is alive!!!

  end

end
