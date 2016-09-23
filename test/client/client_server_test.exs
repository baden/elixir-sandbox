defmodule Sandbox.ClientServerTest do
  use Sandbox.ChannelCase

  alias Sandbox.Client.Server

  test "create several client servers" do

    {:ok, pid1} = Server.start_link(%{id: 1})
    {:ok, pid2} = Server.start_link(%{id: 2})

    IO.puts "ClientServer 1 pid = #{inspect pid1}"
    IO.puts "ClientServer 2 pid = #{inspect pid2}"

    client1 = Server.get(pid1)
    IO.puts "Client 1 pid = #{inspect client1}"

    client2 = Server.get(pid2)
    IO.puts "Client 2 pid = #{inspect client2}"

    # Init state is Create character
    assert client1.state == %{stage: :create_char}
    assert client2.state == %{stage: :create_char}

  end

end
