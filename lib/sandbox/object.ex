defmodule Sandbox.Object do
  defstruct [:id, :type, :birth_at]

  @type t :: %__MODULE__{
    id: integer,
    type: atom
  }

  @doc """
  ## Examples

  # iex> Sandbox.Object.new(:tree)
  # %{type: :tree | _}

  """
  def new(type) do
    %Sandbox.Object{
      type: type,
      birth_at: timestamp()
    }
  end


    @doc """
      Age of object in seconds

      iex> o1 = Sandbox.Object.new(:tree)
      iex> :timer.sleep(1_000)
      iex> Sandbox.Object.age(o1)
      1

    """
    def age(object) do
      timestamp() - object.birth_at
    end


  defp timestamp do
    :os.system_time(:seconds)
  end
end

defmodule Sandbox.Worldpos do
  @moduledoc """
    Position in the world
    x - west to east
    y - south to north
    z - deep to sky
  """
  defstruct [:x, :y, :z]
end

defmodule Sandbox.ObjectKind do
  @kinds [
    :name,              # Name
    :text,              # Text
    :type,              # Object type
    :subtype,           # Object subtype
    :extrainfo,         # Object extra info
    :bonus_to_hit,      # Bonus to hit
    :bonus_to_damage,   # Bonus to damage
    :bonus_to_armor,    # Bonus to armor
    :armor,             # Base armor
    :damage,            # Damage dice/sides
    :weight,            # Weight
    :cost,              # Object "base cost"
    # locale,           # Allocation level(s)
    # chance,           # Allocation chance(s)
    :level,             # Level
    :extra,             # Something
    :k_attr,            # Standard object attribute
    :k_char,            # Standard object character
    :d_attr,            # Default object attribute
    :d_char,            # Default object character
    :x_attr,            # Desired object attribute
    :x_char,            # Desired object character
    :has_flavor,        # This object has a flavor
    :easy_know,         # This object is always known (if aware)
    :esp,               # ESP flags
  ]

  defstruct @kinds

  def all_kinds do
    @kinds
  end

  defimpl Inspect do
    import Inspect.Algebra

    def inspect(set, opts) do
      concat ["#Item<", set.name, ">"]
    end
  end

end

defmodule Sandbox.ArtifactType do
  @kinds [
    :name,        # Name
    :text,        # Text
    :type,        # Artifact type
    :subtype,     # Artifact sub type
    :extrainfo,   # Artifact extra info
    :to_h,        # Bonus to hit
    :to_d,        # Bonus to damage
    :to_a,        # Bonus to armor
    :ac,          # Base armor
    :dd, :ds,     # Damage when hits
    :weight,      # Weight
    :cost,        # Artifact "cost"
    :level,       # Artifact level
    :rarity,      # Artifact rarity

    :cur_num,     # Number created (0 or 1)
    :max_num,     # Unused (should be "1")
    :esp,         # ESP flags

    :known,       # Is this artifact already IDed?

    :carrier,     # Current holder (not necessarily same as o_ptr->owner), just to keep track
    :timeout,     # anti-hoarding artifact reset timer (-1 = permanent)
    :iddc,        # for IDDC_ARTIFACT_FAST_TIMEOUT
    :winner,      # for WINNER_ARTIFACT_FAST_TIMEOUT
  ]

  defstruct @kinds

  def all_kinds do
    @kinds
  end
end

defmodule Sandbox.Artifact do


  def random do
    %Sandbox.ArtifactType{
      name: "random",
      known: false
    }
  end
end

defmodule Sandbox.EgoItemType do
  @kinds [
    :name,        # Name (offset)
    :text,        # Text (offset)
    :before,      # Before or after the object name ?
    :tval,        # [MAX_EGO_BASETYPES],
    :min_sval,    # [MAX_EGO_BASETYPES],
    :max_sval,    # [MAX_EGO_BASETYPES],

    :rating,      # Rating boost

    :level,       # Minimum level
    :rarity,      # Object rarity
    :mrarity,     # Object rarity

    :max_to_h,    # Maximum to-hit bonus
    :max_to_d,    # Maximum to-dam bonus
    :max_to_a,    # Maximum to-ac bonus

    :max_pval,    # Maximum pval
    :cost,        # Ego-item "cost"
    :esp,         # ESP flags
  ]

  defstruct @kinds

  def all_kinds do
    @kinds
  end

end
