defmodule Sandbox.GameChannelTest do
  use Sandbox.ChannelCase

  alias Sandbox.GameChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(GameChannel, "game:lobby")

    {:ok, socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{"hello" => "there", "tick" => 1}
    assert_reply ref, :ok, %{"hello" => "there", "tack" => 2}
  end

  test "shout broadcasts to game:lobby", %{socket: socket} do
    push socket, "shout", %{"hello" => "all"}
    assert_broadcast "shout", %{"hello" => "all"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end

  test "Join new player", %{socket: socket} do
    credentials = %{"user" => "nobody", "password" => "333"}
    ref = push socket, "join", credentials
    assert_reply ref, :ok, %{"result" => "no_user"}
  end


end
