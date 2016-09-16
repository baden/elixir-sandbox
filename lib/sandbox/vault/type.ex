defmodule Sandbox.VaultType do
  @moduledoc """
    ## Information about "vault generation"
  """
  defstruct [
    :name,      # Name
    :text,      # Text
    :type,      # Vault type
    :rat,       # Vault rating
    :hgt,       # Vault height
    :wid,       # Vault width
    :flags1,    # VF1 flags
  ]

end
