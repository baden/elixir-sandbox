defmodule Sandbox.RoomChannelTest do
  use Sandbox.ChannelCase

  alias Sandbox.RoomChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(RoomChannel, "room:lobby")

    {:ok, socket: socket}
  end

  # test "ping replies with status ok", %{socket: socket} do
  #   data = %{"name" => "baden"}
  #   ref = push socket, "join", data
  #   assert_reply ref, :ok, %{"hello" => "there", "tack" => 2}
  # end

  test "test broadcasts to game:lobby", %{socket: socket} do
    push socket, "new_msg", %{"name" => "user", "body" => "some message"}
    assert_broadcast "new_msg", %{name: "user", body: "some message"}
  end
  #
  # test "broadcasts are pushed to the client", %{socket: socket} do
  #   broadcast_from! socket, "broadcast", %{"some" => "data"}
  #   assert_push "broadcast", %{"some" => "data"}
  # end
end
