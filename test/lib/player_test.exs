defmodule PlayerTest do
  use ExUnit.Case
  doctest Sandbox.Player

  test "create a new player" do
    p = %Sandbox.Player{}
    assert p.name == "noname" # Name must to be a "noname"
    assert p.position.world == :lobby # All new players start in lobby
    # At center of :lobby world
    assert p.position.x == 0
    assert p.position.y == 0
  end
end
