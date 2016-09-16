defmodule Sandbox.MonsterBlow do
  @moduledoc """
    ## Monster blow structure
    - Method (RBM_*)
    - Effect (RBE_*)
    - Damage Dice
    - Damage Sides
  """
  @kinds [
    :method,
    :effect,
    :d_dice,
    :d_side,
    :org_d_dice,
    :org_d_side,
  ]

  defstruct @kinds

  def all_kinds do
    @kinds
  end

end

defmodule Sandbox.MonsterRace do
  @kinds [
    :name,        # Name (offset)
    :text,        # Text (offset)
    :dup_idx,        # For mimicry: Race idx of duplicate that differs only in FRIENDS flag

    :hdice,        # Creatures hit dice count
    :hside,        # Creatures hit dice sides

    :ac,        # Armour Class

    :sleep,        # Inactive counter (base)
    :aaf,        # Area affect radius (1-100)
    :speed,        # Speed (normally 110)

    :mexp,        # Exp value for kill

    :weight,    # Weight of the monster
    :extra,        # Unused (for now)

    :freq_innate,    # Innate spell frequency
    :freq_spell,    # Other spell frequency

    :flags1,      # Flags 1 (general)
    :flags2,      # Flags 2 (abilities)
    :flags3,      # Flags 3 (race/resist)
    :flags4,      # Flags 4 (innate/breath)
    :flags5,      # Flags 5 (normal spells)
    :flags6,      # Flags 6 (special spells)
    :flags7,      # Flags 7 (movement related abilities)
    :flags8,      # Flags 8 (wilderness info)
    :flags9,      # Flags 9 (drops info)

    :flags0,      # Flags 10 (extra spells)

    :blow,        # Sandbox.MonsterBlow (Up to four blows per round)

    :body_parts,  # To help to decide what to use when body changing

    :level,       # Level of creature
    :rarity,      # Rarity of creature

    :d_attr,      # Default monster attribute
    :d_char,      # Default monster character

    :x_attr,      # Desired monster attribute
    :x_char,      # Desired monster character

    :max_num,      # Maximum population allowed per level

    :cur_num,      # Monster population on current level

    :r_sights,      # Count sightings of this monster
    :r_deaths,      # Count deaths from this monster
    :r_tkills,      # Count monsters killed by all players

    :r_pkills,      # Count monsters killed in this life

    :r_wake,        # Number of times woken up (?)
    :r_ignore,      # Number of times ignored (?)

    :r_xtra2,       # Something (unused)

    :r_drop_gold,   # Max number of gold dropped at once
    :r_drop_item,   # Max number of item dropped at once

    :r_cast_innate, # Max number of innate spells seen
    :r_cast_spell,  # Max number of other spells seen

    :r_blows,       # Number of times each blow type was seen

    :r_flags1,      # Observed racial flags
    :r_flags2,      # Observed racial flags
    :r_flags3,      # Observed racial flags
    :r_flags4,      # Observed racial flags
    :r_flags5,      # Observed racial flags
    :r_flags6,      # Observed racial flags

    :drops,         # The drops type

    :u_idx,         # Counter for sorted unique positioning

    :restrict_dun,   # restrict to specific dungeon (used for non-FINAL_GUARDIAN monsters)
  ]

  defstruct @kinds

  def all_kinds do
    @kinds
  end

end
