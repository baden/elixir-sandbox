defmodule Sandbox.Player.Character do

  @sexes [:male, :female]

  defstruct [
    # Main
    :name,
    :sex,
    :race,
    :class,
    :size,
    :exp,

    :hp,
    :stamina,
    :mana,
    :resists, # Map for: fire, lightning, etc...

    :speed, # Map for: global, movement, spell, attack, mental, etc...

    :stats,  # Map: %Sandbox.Playes.Stats{}

    # Own base abilities
    :accuracy,
    :defence,

    # Resources
    :gold,
    :items,
    :talents, # Map for all talents
    :effects, # Magic upgrades?

    # Staistics
    :statistics,  # Map for: times dies, kills, etc...
  ]

  def new do
    %__MODULE__{sex: :male}
  end

end
