defmodule Sandbox.Player do
  defstruct [
    name: "noname",
    position: %{
      world: :lobby,
      x: 0,
      y: 0
    }
  ]
end
