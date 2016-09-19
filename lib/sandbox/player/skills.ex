defmodule Sandbox.Player.Skills do
  @skills [
    :COMBAT,
    :MASTERY,
    :SWORD,
    :CRITS,
    :POLEARM,
    :BLUNT,
    :ARCHERY,
    :SLING,
    :BOW,
    :XBOW,
    :BACKSTAB,
    :MAGIC,
    :CASTSPEED,
    :SHOOT_TILL_KILL,
    :SORCERY,
    :MAGERY,
    :MIMIC,
    :DEVICE,
    :SHADOW,
    :PRAY,
    :SPELLLENGTH,
    :SNEAKINESS,
    :DISARM,
    :STEALTH,
    :STEALING,
    :NECROMANCY,
    :ANTIMAGIC,
    # AURA_POWER
    :TRAUMATURGY,
    :AURA_FEAR,
    :AURA_SHIVER,
    :AURA_DEATH,
    :HUNTING,
    :TECHNIQUE,
    :MISC,
    :AGILITY,
    :CALMNESS,
    :SWIM,
    :MARTIAL_ARTS,
    :RICOCHET,
    :BOOMERANG,
    :TRAINING,
    :INTERCEPT,
    :DODGE,
    :HEALTH,
    :DIG,
    :SPELLRAD,
    :TRAPPING,
    :AXE,

    # School skills
    :CONVEYANCE,
    :SPELL,
    :MANA,
    :FIRE,
    :AIR,
    :WATER,
    :NATURE,
    :EARTH,
    :DIVINATION,
    :TEMPORAL,
    :META,
    :MIND,
    :UDUN,

    :HOFFENSE,
    :HDEFENSE,
    :HCURING,
    :HSUPPORT,

    :DRUID_ARCANE,
    :DRUID_PHYSICAL,

    :ASTRAL,

    :DUAL,        # dual-wield for rogues
    :STANCE,      # combat stances for warriors

    :PPOWER,      # the new mindcrafter skills
    :TCONTACT,    # the new mindcrafter skills
    :MINTRUSION,  # the new mindcrafter skills

    # Dummy skills - just to make the mass of schools
    # appear more ordered - C. Blue
    :SCHOOL_MAGIC,
    :SCHOOL_PRAYING,
    :SCHOOL_DRUIDISM,
    :SCHOOL_MINDCRAFT,

    # additional ones
    :CLIMB,
    :LEVITATE,
    :FREEACT,
    :RESCONF,

    :INNATE_POWER,  # in mimicry tree
    :EGO_POWER,

    :SCHOOL_RUNECRAFT,
    :R_LITE,
    :R_DARK,
    :R_NEXU,
    :R_NETH,
    :R_CHAO,
    :R_MANA,

    # For Draconians
    :BREATH,
  ]

  defstruct skills: %{}

  def skills do
    @skills
  end

  def put_skills do
    for skill <- @skills do
      IO.puts("Skill: #{skill}")
    end
    :ok
  end

  def new() do
    %__MODULE__{skills: %{}}
  end

  def from_skills(skills \\ %{}) do
    %__MODULE__{skills: skills}
  end

  def emojy do
    "🎅"
  end
end
