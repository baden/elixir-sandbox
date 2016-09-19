defmodule Sandbox.Playes.Stats do
  import Sandbox.Gettext

  # Inpired by http://te4.org/wiki/Stat

  @base_stats [
    # Base stats
    :strength,
    :dexterity,
    :constitution,
    :magic,
    :willpower,
    :cunning,
    :stats, # Map for extended stats
  ]

  defstruct [:base, :extra]

  def description(:strength) do
    gettext "player_stats_description_strength"
  end

  def description(:dexterity) do
    gettext "player_stats_description_dexterity"
  end

  def gains(:dexterity) do
    %{
      "Defense":                    0.35,
      "Ranged defense":             0.35,
      "Accuracy":                   1.00,
      "Shrug off criticals chance": 0.30,
    }
  end
end
