defmodule Sandbox.Item.Category do

  # TODO: split to type and subtype:
  # Type: weapon, subtype: dagger, greatmaul, etc.
  # Type: tool, subtype: digger, pickaxe, etc

  @categories [
    :amulet,
    :ring,
    :infusion,    # scroll?
    :sword,
    :greatsword,  # Maybe flags?
    :bow,
    :shortbow,
    :longbow,
    :staff,
    :axe,
    :waraxe,
    :pickaxe, # tool? / digger?
    :cloth,
    :arrow,
    :dagger,
    :orb,
    :gem,   # colour or type? agate/black, ametrine/yellow, etc...
    :tool,  # misc
    :armoir,  # types: hands, etc
  ]

end
