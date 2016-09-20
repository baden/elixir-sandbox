defmodule UpdateOperator do

  @doc """
  ### Easy map update

  Founded here: (https://github.com/tzveeJ/UpdateOperator)

  iex> import UpdateOperator
  iex> mymap = %{foo: %{bar: %{baz: "original value"}}}
  iex> "new value" ~> mymap.foo.bar.baz
  %{foo: %{bar: %{baz: "new value"}}}

  """
  defmacro a ~> b do
    quote do
      put_in(unquote(b), unquote(a))
    end
  end


  # @doc """
  # ### Easy add field to map
  #
  # iex> import UpdateOperator
  # iex> mymap = %{foo: %{bar: %{baz: "original value"}}}
  # iex> "new value" +~> mymap.foo.bar.bazar
  # %{foo: %{bar: %{baz: "original value", bazar: "new value"}}}
  #
  # """
  # defmacro a +~> b do
  #   quote do
  #     put_in(unquote(b), unquote(a))
  #   end
  # end

end
