# Sandbox

**TODO: Add description**

## Depends: Docker & Docker-compose

* Ubuntu and Debuan:

  https://docs.docker.com/engine/installation/linux/ubuntulinux/
  https://docs.docker.com/compose/install/


## Test

```shell
docker-compose run -p 4000:4000 -p 4001:4001 --user $(id -u):$(id -g) -w /home/user/app app /bin/bash

> mix deps.get
> mix ecto.create && mix ecto.migrate
> mix test


## Run dev server

docker-compose run -p 4000:4000 -p 4001:4001 --user $(id -u):$(id -g) -w /home/user/app app /bin/bash

> mix deps.get
> mix ecto.create && mix ecto.migrate
> npm i
> mix phoenix.server


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
mix deps.get
mix compile
```

## Run

* In Console

```shell
# mix run
iex -S mix
```

## Run in docker

```shell
docker-compose run -p 8981:8981 -p 8982:8982 -p 8983:8983 --user $(id -u):$(id -g) -w /home/user/app app /bin/bash
```

## Run as phoenix app (TBD)

1. Install dependencies with `mix deps.get`
2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit http://localhost:4000 from your browser.
