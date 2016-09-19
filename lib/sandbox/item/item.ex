defmodule Sandbox.Item do

  @remove_on_floor [
    # /* erase items on the floor? */
    :REMOVAL_NORMAL,    # this must always be 0 (assumed as default if not set to a different value) */
    :REMOVAL_NEVER,	    # Item will never 'timeout' */
    :REMOVAL_HOUSE,     # Item is inside a house and because of that will never 'timeout' */
    :REMOVAL_DEATH_WILD, # Items are death loot, but not in dungeon (would be ITEM_REMOVAL_NEVER) but in the wilderness */
    :REMOVAL_LONG_WILD,	#	Item times out even much slower than from ITEM_REMOVAL_DEATH_WILD */
    :REMOVAL_QUICK,	    # To keep pvp-arena clean: 10 minutes timeout flat. */
    :REMOVAL_MONTRAP,	  # Item is part of a monster trap and hence should last quite a while */
  ]

end
