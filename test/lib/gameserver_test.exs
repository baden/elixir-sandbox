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

    player = &Sandbox.GameServer.get_game.players[&1]
    # TODO: now one command at a time, but need a set(?) of commands
    assert player.(0).command == {:walk, :east}

    game_after = Sandbox.GameServer.get_game
    assert World.players_count(game_after) == 2
    IO.puts "\nGame  after = #{inspect game_after}"

    players = game_after.players
    assert players[0].name == "Bob"
    assert players[0].position.x == 0   # Not moved jet but start walking
    assert players[1].position.y == 0   # Not moved jet but start walking

    :timer.sleep(550) # Wait total a bit more than 0.5 sec

    # pos = fn(player_id), do end
    pos = &Sandbox.GameServer.get_game.players[&1].position

    assert pos.(0).x == 0   # Bob is not moved yet
    assert pos.(1).y == 1   # Wow, she is alive!!!

    :timer.sleep(500) # Wait total a bit more than 1 sec

    assert pos.(0).x == 1   # Wow, he is alive!!!
    assert pos.(1).y == 2   # Alice is run to far

    :timer.sleep(500) # Wait total a bit more than 1.5 sec

    assert pos.(0).x == 1   # Bob slow like a snail
    assert pos.(1).y == 3   # Alice is run to far away

    # Stop a Alice
    Sandbox.GameServer.player_command(1, :stop_walk)

    :timer.sleep(500) # Wait total a bit more than 2.0 sec

    assert pos.(0).x == 2   # Bob slow like a lazy snail
    assert pos.(1).y == 4   # Alice finish walking and wait for new command

    :timer.sleep(1_000) # Wait total a bit more than 3.0 sec

    assert pos.(0).x == 3   # Bob slow like a big lazy snail
    assert pos.(1).y == 4   # Alice not got new commands

  end

end
