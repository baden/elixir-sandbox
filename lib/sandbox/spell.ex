defmodule Sandbox.Spell.UseModel do
  @enum [
    :sustained,
    :activated,
    :passive,
  ]
end

defmodule Sandbox.Spell do

  @spells %{
    "Stone Skin": %{
      element: [:earth],
      use_model: [:sustained],
      mana_cost: 30,
      range: [:melee, :personal],
      cooldown: 10,
      usage_speed: 100,
    },
    "Pulverizing Augar": %{
      element: [:earth],
      use_model: [:activated],
      mana_cost: 15.6,
      range: 3,
      cooldown: 6,
      usage_speed: 100,
      }

  }

  def all do
    @spells
  end

end
