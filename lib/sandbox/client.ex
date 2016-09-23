defmodule Sandbox.Client do
  defstruct [
    :id,
    :state
  ]

  @moduledoc """
  Save connected client state

  Main client states:

  1. Create character

  """

  def new(id) do
    init_state = %{
      stage: :create_char
    }
    %Sandbox.Client{id: id, state: init_state}
  end

  def connect(id) do
    # TODO: Check if client already exists
    if exists?(id) do
      get!(id)
    else
      new(id)
    end
  end

  # TODO: Add check exists logic here
  defp exists?(id) do
    true
  end

  # TODO: Add get exist client here
  defp get!(id) do
    new(id)
  end


end
