defmodule Sandbox.Dungeon do

  alias Sandbox.Dungeon.Type

  @max_depth 128

  def max_depth, do: @max_depth

  def types, do: Type.types

end
