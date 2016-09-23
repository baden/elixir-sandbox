defmodule Sandbox.GameChannel do
  use Sandbox.Web, :channel

  def join("game:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    tick = payload["tick"]
    reply = put_in payload["tack"], (tick+1)
    {:reply, {:ok, reply}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (game:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("join", %{"user" => name, "password" => password}, socket) do
    # player_id = IdServer.get_id(socket.transport_pid)
    # GameServer.add_client(player_id, name)
    # TBD: Check user
    response = %{"result" => "no_user"}
    {:reply, {:ok, response}, socket}
  end


  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
