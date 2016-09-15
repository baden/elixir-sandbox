defmodule Sandbox.PageControllerTest do
  use Sandbox.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    # resp = html_response(conn, 200)
    # IO.puts "Index: #{inspect resp}"
    assert html_response(conn, 200) =~ "DOCTYPE html"
  end
end
