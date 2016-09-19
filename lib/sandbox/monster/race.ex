defmodule Sandbox.Monster.Race do
  @flags [
    :UNIQUE,  #Unique Monster
    :QUESTOR,  #Quest Monster
    :MALE,  #Male gender
    :FEMALE,  #Female gender
    :CHAR_CLEAR,  #Absorbs symbol
    :CHAR_MULTI,  #Changes symbol
    :ATTR_CLEAR,  #Absorbs color
    :ATTR_MULTI,  #Changes color
    :FORCE_DEPTH,  #Start at "correct" depth
    :FORCE_MAXHP,  #Start with max hitpoints
    :FORCE_SLEEP,  #Start out with very low energy - but this is now deprecated since monsters even start out with negative energy nowadays to avoid insta-breath-kills - C. Blue
    :FORCE_EXTRA,  #Start out something
    :FRIEND,  #Arrive with a friend
    :FRIENDS,  #Arrive with some friends
    :ESCORT,  #Arrive with an escort
    :ESCORTS,  #Arrive with some escorts
    :NEVER_BLOW,  #Never make physical blow
    :NEVER_MOVE,  #Never make physical move
    :RAND_25,  #Moves randomly (25%)
    :RAND_50,  #Moves randomly (50%)
    :ONLY_GOLD,  #Drop only gold
    :ONLY_ITEM,  #Drop only items
    :DROP_60,  #Drop an item/gold (60%)
    :DROP_90,  #Drop an item/gold (90%)
    :DROP_1D2,  #Drop 1d2 items/gold
    :DROP_2D2,  #Drop 2d2 items/gold
    :DROP_3D2,  #Drop 3d2 items/gold
    :DROP_4D2,  #Drop 4d2 items/gold
    :DROP_GOOD,  #Drop good items
    :DROP_GREAT,  #Drop great items
    :DROP_USEFUL,  #Drop "useful" items
    :DROP_CHOSEN,  #Drop "chosen" items

    :STUPID,  #Monster is stupid
    :SMART,  #Monster is smart
    :CAN_SPEAK,  #TY: can speak
    :REFLECTING,  #Reflects bolts
    :INVISIBLE,  #Monster avoids vision
    :COLD_BLOOD,  #Monster avoids infra
    :EMPTY_MIND,  #Monster avoids telepathy
    :WEIRD_MIND,  #Monster avoids telepathy?
    :DEATH_ORB,  #Death Orb
    :REGENERATE,  #Monster regenerates
    :SHAPECHANGER,  #TY: shapechanger
    :ATTR_ANY,  #TY: Attr_any
    :POWERFUL,  #Monster has strong breath
    :ELDRITCH_HORROR,  #Sanity-blasting horror
    :AURA_FIRE,  #Burns in melee
    :AURA_ELEC,  #Shocks in melee
    :OPEN_DOOR,  #Monster can open doors
    :BASH_DOOR,  #Monster can bash doors
    :PASS_WALL,  #Monster can pass walls
    :KILL_WALL,  #Monster can destroy walls
    :MOVE_BODY,  #Monster can move monsters
    :KILL_BODY,  #Monster can kill monsters
    :TAKE_ITEM,  #Monster can pick up items
    :KILL_ITEM,  #Monster can crush items
    :BRAIN_1,  #unusued..?
    :BRAIN_2,
    :BRAIN_3,
    :BRAIN_4,
    :BRAIN_5,
    :BRAIN_6,
    :BRAIN_7,
    :BRAIN_8,
    :ORC,  #Orc
    :TROLL,  #Troll
    :GIANT,  #Giant
    :DRAGON,  #Dragon
    :DEMON,  #Demon
    :UNDEAD,  #Undead
    :EVIL,  #Evil
    :ANIMAL,  #Animal
    :DRAGONRIDER,  #DG: DragonRider
    :GOOD,  #Good
    :AURA_COLD,  #Freezes in melee
    :NONLIVING,  #TY: Non-Living (?)
    :HURT_LITE,  #Hurt by lite
    :HURT_ROCK,  #Hurt by rock remover
    :SUSCEP_FIRE,  #Hurt badly by fire
    :SUSCEP_COLD,  #Hurt badly by cold
    :IM_ACID,  #Resist acid a lot
    :IM_ELEC,  #Resist elec a lot
    :IM_FIRE,  #Resist fire a lot
    :IM_COLD,  #Resist cold a lot
    :IM_POIS,  #Resist poison a lot
    :RES_TELE,  #Resist teleportation
    :RES_NETH,  #Resist nether a lot
    :RES_WATE,  #Resist water
    :RES_PLAS,  #Resist plasma
    :RES_NEXU,  #Resist nexus
    :RES_DISE,  #Resist disenchantment
    :UNIQUE_4,  #Is a "Nazgul" unique -- UNUSED
    :NO_FEAR,  #Cannot be scared
    :NO_STUN,  #Cannot be stunned
    :NO_CONF,  #Cannot be confused
    :NO_SLEEP,  #Cannot be slept

    :SHRIEK,  #Shriek for help
    :UNMAGIC,  #Cancel player's timed spell
    :S_ANIMAL,  #Summon animals
    :ROCKET,  #TY: Rocket
    :ARROW_1,  #Fire an arrow (light)
    :ARROW_2,  #Fire a shot (heavy)
    :ARROW_3,  #Fire a bolt (heavy)
    :ARROW_4,  #Fire a missile (heavy)
    :BR_ACID,  #Breathe Acid
    :BR_ELEC,  #Breathe Elec
    :BR_FIRE,  #Breathe Fire
    :BR_COLD,  #Breathe Cold
    :BR_POIS,  #Breathe Poison
    :BR_NETH,  #Breathe Nether
    :BR_LITE,  #Breathe Lite
    :BR_DARK,  #Breathe Dark
    :BR_CONF,  #Breathe Confusion
    :BR_SOUN,  #Breathe Sound
    :BR_CHAO,  #Breathe Chaos
    :BR_DISE,  #Breathe Disenchant
    :BR_NEXU,  #Breathe Nexus
    :BR_TIME,  #Breathe Time
    :BR_INER,  #Breathe Inertia
    :BR_GRAV,  #Breathe Gravity
    :BR_SHAR,  #Breathe Shards
    :BR_PLAS,  #Breathe Plasma
    :BR_WALL,  #Breathe Force
    :BR_MANA,  #Breathe Mana
    :BR_DISI,  #Breathe Disintegration
    :BR_NUKE,  #TY: Toxic Breath
    :MOAN,  #For Halloween event :) -C. Blue
    :BOULDER,  #Hurl Boulder (Vanilla)

    :BA_ACID,  #Acid Ball
    :BA_ELEC,  #Elec Ball
    :BA_FIRE,  #Fire Ball
    :BA_COLD,  #Cold Ball
    :BA_POIS,  #Poison Ball
    :BA_NETH,  #Nether Ball
    :BA_WATE,  #Water Ball
    :BA_MANA,  #Mana Storm
    :BA_DARK,  #Darkness Storm
    :DRAIN_MANA,  #Drain Mana
    :MIND_BLAST,  #Blast Mind
    :BRAIN_SMASH,  #Smash Brain
    :CURSE,  #Cause Light Wound
    :RAND_100,  #100% random movement
    :BA_NUKE,  #TY: Nuke Ball
    :BA_CHAO,  #Chaos Ball
    :BO_ACID,  #Acid Bolt
    :BO_ELEC,  #Elec Bolt (unused)
    :BO_FIRE,  #Fire Bolt
    :BO_COLD,  #Cold Bolt
    :BO_POIS,  #Poison Bolt (unused/not implemented for monsters)
    :BO_NETH,  #Nether Bolt
    :BO_WATE,  #Water Bolt
    :BO_MANA,  #Mana Bolt
    :BO_PLAS,  #Plasma Bolt
    :BO_ICEE,  #Ice Bolt
    :MISSILE,  #Magic Missile
    :SCARE,  #Frighten Player
    :BLIND,  #Blind Player
    :CONF,  #Confuse Player
    :SLOW,  #Slow Player
    :HOLD,  #Paralyze Player


    :HASTE,  #Speed self
    :HAND_DOOM,  #Hand of Doom
    :HEAL,  #Heal self
    :S_ANIMALS,  #Summon animals
    :BLINK,  #Teleport Short
    :TPORT,  #Teleport Long
    :RAISE_DEAD,  #Raise Dead -- not implemented
    :S_BUG,  #Summon Software bug
    :TELE_TO,  #Move player to monster
    :TELE_AWAY,  #Move player far away
    :TELE_LEVEL,  #Move player vertically
    :S_RNG,  #Summon RNG
    :DARKNESS,  #Create Darkness
    :TRAPS,  #Create Traps
    :FORGET,  #Cause amnesia
    :S_DRAGONRIDER,  #Summon DragonRiders
    :S_KIN,  #Summon "kin"
    :S_HI_DEMON,  #Summon greater demons!
    :S_MONSTER,  #Summon Monster
    :S_MONSTERS,  #Summon Monsters
    :S_ANT,  #Summon Ants
    :S_SPIDER,  #Summon Spiders
    :S_HOUND,  #Summon Hounds
    :S_HYDRA,  #Summon Hydras
    :S_ANGEL,  #Summon Angel
    :S_DEMON,  #Summon Demon
    :S_UNDEAD,  #Summon Undead
    :S_DRAGON,  #Summon Dragon
    :S_HI_UNDEAD,  #Summon Greater Undead
    :S_HI_DRAGON,  #Summon Ancient Dragon
    :S_NAZGUL,  #Summon Unique Wraith
    :S_UNIQUE,  #Summon Unique Monster

    :AQUATIC,  #Aquatic monster
    :CAN_SWIM,  #Monster can swim
    :CAN_FLY,  #Monster can fly
    :FRIENDLY,  #Monster is friendly
    :PET,  #Monster is a pet
    :MORTAL,  #Monster is a mortal being -- UNUSED
    :SPIDER,  #Monster is a spider (can pass webs)
    :NAZGUL,  #Monster is a Nazgul
    :DG_CURSE,  #If killed the monster grant a DG Curse to the player
    :POSSESSOR,  #Is it a dreaded possessor monster ? -- UNUSED
    :NO_DEATH,  #Cannot be killed
    :NO_TARGET,  #Cannot be targeted
    :AI_ANNOY,  #Try to tease the player
    :AI_SPECIAL,  #For quests
    :NEUTRAL,  #Monster is neutral
    :DROPART,  #Monster is neutral
    :DROPRANDART,  #Monster is neutral
    :AI_PLAYER,  #Monster is neutral
    :NO_THEFT,  #Monster is neutral
    :NEVER_ACT,  #Monster is neutral
    :NO_ESP,  #monster isn't ESPable
    :ATTR_BASE,  #show base attr too. Atm works if a) only 1 breath and ATTR_MULTI (DRs) or b) ATTR_BNW is set
    :VORTEX,  #experimental: flicker extremely fast - not working atm
    :OOD_20,  #Cannot occur more than 20 levels OoD
    :OOD_15,  #Cannot occur more than 15 levels OoD
    :OOD_10,  #Cannot occur more than 10 levels OoD
    :ATTR_BNW,  #Monster flickers w/ TERM_BNW colour (ie black and white), also see SLOW_ATTR_BNW
    :S_LOWEXP,  #Summons/Clones give little exp
    :S_NOEXP,  #Summons/Clones don't give exp
    :ATTR_BREATH,  #Use client breath colouring (unused & not implemented)
    :MULTIPLY,  #Monster reproduces
    :DISBELIEVE,  #Antimagic shield

    :DUNGEON,
    :WILD_TOWN,
    :WILD_EASY,
    :WILD_SHORE,
    :WILD_OCEAN,
    :WILD_WASTE,
    :WILD_WOOD,
    :WILD_VOLCANO,
    :RAND_5,  #Moves very slightly randomly (5%) (for Panda, so it's not appearing totally 'passive' - C. Blue)
    :WILD_MOUNTAIN,
    :WILD_GRASS,
    :NO_CUT,
    :CTHANGBAND,
    :PERNANGBAND,
    :ZANGBAND,
    :JOKEANGBAND,
    :ANGBAND,
    :BLUEBAND,  #C. Blue's bestiary
    :NO_AUTORET,  #don't auto-retaliate against this monster
    :WILD_DESERT,
    :WILD_ICE,
    :NETHER_REALM,  #may only spawn in the Nether Realm
    :PLURAL,  #The monster's name is already in plural form
    :NO_BLOCK,  #This monster never blocks hits
    :ALLOW_RUNNING,  #Player may run even with this monster (awake) in LoS
    :AVOID_PERMAWALLS,  #spawns distant of permanent walls (maybe/only for Dor)
    :PSEUDO_UNIQUE,  #Not a unique monster (does not appear in the uniques list), but named/looks like one (added for Santa Claus); monster form cannot be learnt by mimics. Cannot be cloned.
    :GENO_PERSIST,  #Don't automatically genocide/compact this monster
    :GENO_NO_THIN,  #Don't genocide this monster when thinning out surface spawns
    :CLIMB,  #NOT YET IMPLEMENTED: Can walk over mountain fields
    :WILD_SWAMP,  #ToDo: Implement Swamp
    :WILD_TOO,
    :DROP_CORPSE,
    :DROP_SKELETON,
    :HAS_LITE,  #Carries a lite
    :MIMIC,  #*REALLY* looks like an object ... only nastier
    :HAS_EGG,  #Can be monster's eggs
    :IMPRESSED,  #The monster can follow you on each level until he dies
    :SUSCEP_ACID,  #Susceptible to acid
    :SUSCEP_ELEC,  #Susceptible to lightning
    :SUSCEP_POIS,  #Susceptible to poison
    :KILL_TREES,  #Monster can eat trees
    :WYRM_PROTECT,  #The monster is protected by great wyrms of power: They'll be summoned if it's killed
    :DOPPLEGANGER,  #The monster looks like you
    :ONLY_DEPTH,  #The monster can only be generated at the GIVEN depth
    :SPECIAL_GENE,  #The monster can only be generated in special conditions like quests, special dungeons, ... NOTE: currently no effect!
    :NEVER_GENE,  #The monster cannot be normaly generated
    # /* no_conf, no_fear, no_sleep, res_<others> already exist (C. Blue)
    # /* These flags are added to r_info for improved logic in mimic forms (eg chaos hound gives res_chaos)
    # /* The resistance flags are added to distinguish between im_ and res_ now. Until now im_ was simply a strong res.
    :RES_ACID,
    :RES_ELEC,
    :RES_FIRE,
    :RES_COLD,
    :RES_POIS,
    :RES_LITE,
    :RES_DARK,
    :RES_BLIND,
    :RES_SOUND,
    :RES_SHARDS,
    :RES_CHAOS,
    :RES_TIME,
    :RES_MANA,
    :IM_WATER,  #Water immunity, should also let you breathe under water
    # /* Hm, fits in perfectly :) Fate?
    # /* these flags are not in PernA nor in PernM-monsters,
    #  * but the code for them already exists in our code..
    #  * Let's consider of recycling them :)		- Jir -
    :IM_TELE,  #Resist teleportation
    :IM_PSI,  #Immune to (?)
    :RES_PSI,  #Resist (?)

    :S_HI_MONSTER,
    :S_HI_MONSTERS,
    :S_HI_UNIQUE,
    :ASTAR,  #monster uses A* pathfinding (use with care, might strain CPU)
    :NO_ESCORT,  #monster will never occur in groups, like escorts or nests/pits
    :NO_NEST,  #monster will never occur in groups, like escorts or nests/pits
    :FINAL_GUARDIAN,  #monster is defined as FINAL_GUARDIAN_ in d_info.txt
    :BO_DISE,
    :BA_DISE,
    :ROAMING,  #monster never spawns in vaults or pits (ie on CAVE_ICKY/CAVE_NEST_PIT grids)
    :DROP_1,  #Drop exactly 1 item/gold

  ]

  @races [

  ]

  def flags, do: @flags

end
