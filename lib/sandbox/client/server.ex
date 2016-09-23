defmodule Sandbox.Client.Server do
  require Logger
  alias Sandbox.Client
  use GenServer

  def start_link(params) do
    Logger.debug("Starting Client...")
    GenServer.start_link(__MODULE__, params)
  end

  def init(%{id: id}) do
    # :ets.insert(:appstats, {sensorid, 0, 0, 0})
    # :erlang.send_after(10000, self, {:sync, sensorid})
    {:ok, Client.connect(id)}
  end

  def get(server) do
    GenServer.call(server, :get)
  end

  def handle_call(:get, _from, client) do
    {:reply, client, client}
  end


end
