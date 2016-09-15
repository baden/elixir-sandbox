defmodule WorldTest do
  use ExUnit.Case
  doctest Sandbox.World
  alias Sandbox.World
  alias Sandbox.Player

  test "Create empty world" do
    s = %World{}
    assert s.players == []
  end

  test "Testing app player to new world" do
    s = %World{}
    assert s.players == []

    p = %Player{name: "Bob"}
    s1 = World.add_player(s, p)
    assert s1.players == [p]
    IO.puts "Players: #{inspect s1}"
  end

end
