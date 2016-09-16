defmodule ObjectTest do
  use ExUnit.Case
  doctest Sandbox.Object

  test "create a new abstract object" do
    o1 = Sandbox.Object.new(:tree)
    assert o1.type == :tree
  end
end
