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

    # Alice want walk to north
    Sandbox.GameServer.player_command(1, {:walk, :north})

    # s1 = World.add_player(s, p)

    # g = Sandbox.GameServer.get_game
    # players = Sandbox.GameServer.players
    game_after = Sandbox.GameServer.get_game

    assert World.players_count(game_after) == 2

    IO.puts "\nGame  after = #{inspect game_after}"

    players = game_after.players
    assert players[0].name == "Bob"
    assert players[0].position.x == 0   # Not moved jet but start walking
    assert players[1].position.y == 0   # Not moved jet but start walking

    :timer.sleep(510) # Wait total a bit more than 0.5 sec

    assert Sandbox.GameServer.get_game.players[1].position.y == 1   # Wow, she is alive!!!
    assert Sandbox.GameServer.get_game.players[0].position.x == 0   # But he is not moved yet!!!

    :timer.sleep(500) # Wait total a bit more than 1 sec

    # game_after2 =
    # IO.puts "\nGame  after = #{inspect game_after2}"
    assert Sandbox.GameServer.get_game.players[0].position.x == 1   # Wow, he is alive!!!
    # assert game_after2.players[1].position.y == 2   # Wow, she is alive too!!!

  end

end
