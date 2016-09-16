defmodule Sandbox.Utils do
  @doc """
    Returns the atom representation of a string.
  """
  def sigil_a(string, []) do
    String.to_atom(string)
  end
end

defmodule Sandbox.Player.Class do
  @classes ~w(
    WARRIOR PALADIN MIMIC ROGUE RANGER
  )a
  # defstruct @classes

  defstruct classname: :noclass

  def classes do
    @classes
  end

  def put_classes do
    for class <- @classes do
      IO.puts("Class: #{class}")
    end
    :ok
  end

  def new() do
    import Sandbox.Utils
    %__MODULE__{classname: ~a(new)}
  end

  def from_name(name \\ :new) do
    %__MODULE__{classname: name}
  end


  def emojy do
    "🎅"
  end
end
