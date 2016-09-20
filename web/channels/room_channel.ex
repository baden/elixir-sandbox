defmodule Sandbox.RoomChannel do
  use Phoenix.Channel
  require Logger
  alias Sandbox.Client.IdServer

  def join("room:lobby", payload, socket) do
    Logger.info("Someone has join to room:lobby with #{inspect payload}")
    IdServer.generate_id(socket.transport_pid)
    {:ok, %{some: "useful"}, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def terminate(_reason, socket) do
    IdServer.get_id(socket.transport_pid)
    # |> GameServer.remove_player
  end

  def handle_in("join", %{"name" => name}, socket) do
    player_id = IdServer.get_id(socket.transport_pid)
    GameServer.add_client(player_id, name)
    {:reply, {:ok, %{"player_id" => player_id}}, socket}
  end

  def handle_in("new_msg", %{"name" => name, "body" => body}, socket) do
    Logger.info("Someone #{name} send a message:#{inspect body}")
    msg = %{
      timestamp: :erlang.system_time,
      name: name,
      body: body
    }
    broadcast! socket, "new_msg", msg
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    # IO.puts "Someone push a message:" <> payload
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
