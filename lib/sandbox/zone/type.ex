defmodule Sandbox.Zone.Type do
  @moduledoc """
    ## Information about "vault generation"
  """
  defstruct [
    :name,      # Name
    :text,      # Description?
    :guardians,
    :floors,
    :level_range, # {min, max}
    :item_level_range,
    :size,      # {width, height}
    :zone_effect,
  ]

end
