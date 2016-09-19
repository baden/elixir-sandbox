defmodule WorldTest do
  use ExUnit.Case
  doctest Sandbox.World
  alias Sandbox.World
  alias Sandbox.Player

  test "Create empty world" do
    s = %World{}
    assert s.players == %{}
  end

  test "Testing app player to new world" do
    s = %World{}
    assert s.players == %{}

    player_id = 0
    player = %Player{name: "Bob"}
    s1 = World.add_player(s, player_id, player)
    # assert s1.players == [p]
    IO.puts "Players: #{inspect s1}"
  end

  test "Testing add item to world" do
    i1 = %Sandbox.ObjectKind{name: "item1"}
    i2 = %Sandbox.ObjectKind{name: "item2"}
    i3 = %Sandbox.ObjectKind{name: "item3"}
    w = %World{}
      |> World.add_item(i1, {10, 10, 0})
      |> World.add_item(i2, {10, 10, 0})
      |> World.add_item(i3, {12, 10, 0})

    IO.puts "World: #{inspect w}"
    # Stack order
    assert World.land(w, {10, 10, 0}) == [i2, i1]
    assert World.land(w, {12, 10, 0}) == [i3]
    assert World.land(w, {10, 12, 0}) == []
    IO.puts "Item: #{inspect i1}"
  end

  test "Benchmark" do
    mem_before = :erlang.memory(:processes)
    start = :os.system_time :nano_seconds
    items_to_add = 10_000
    add_func = fn(i, acc) ->
      i = %Sandbox.ObjectKind{name: "item #{i}"}
      World.add_item(acc, i, {10, 10, 0})
    end
    w = (1..items_to_add) |> Enum.reduce(%World{}, add_func)
    finish = :os.system_time :nano_seconds
    mem_after = :erlang.memory(:processes)
    IO.puts "Items per second: #{round(items_to_add * 1_000_000_000 / (finish - start))}"

    l = World.land(w, {10, 10, 0}) |> Enum.count
    IO.puts "Items in land: #{inspect l}"

    IO.puts "Memory bofore: #{mem_before / 1024 / 1024}"
    IO.puts "Memory  after: #{mem_after / 1024 / 1024}"

    # :timer.sleep(10_000)

    assert true
  end

end
