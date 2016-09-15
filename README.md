# Sandbox

**TODO: Add description**

## Depends: Erlang & Elixir

* Ubuntu and Debuan:

```shell
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
rm erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir
```

## Testing

```shell
mix test
```

## Compile

```shell
mix deps
mix compile
```

## Run

* In Console

```shell
# mix run
iex -S mix
```
