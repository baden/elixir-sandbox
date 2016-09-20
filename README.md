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
```

## Run dev server

```shell
docker-compose run -p 4000:4000 -p 4001:4001 --user $(id -u):$(id -g) -w /home/user/app app /bin/bash

> mix deps.get
> mix ecto.create && mix ecto.migrate
> npm i
> mix phoenix.server
```

## Build release (TBD)

TODO: I can build several times, but later i got dependencies errors and can't build.

```shell
MIX_ENV=prod mix deps.get
npm i
MIX_ENV=prod npm run compile
MIX_ENV=prod mix phoenix.digest
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
```

Now, we can deploy archive `rel/sandbox/releases/0.1.0/sandbox.tar.gz` to remote host.

## Start release

Several instructions:
* [one](http://www.phoenixframework.org/docs/advanced-deployment)
* [two](http://blog.plataformatec.com.br/2016/04/running-migration-in-an-exrm-release/)

### Prepare database
```shell
rel/sandbox/bin/sandbox command release_tasks create
rel/sandbox/bin/sandbox command release_tasks migrate
```

### Start in console (testing)

```shell
rel/sandbox/bin/sandbox console
```


# Deprecated

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

## Inspiration

* https://ru.wikipedia.org/wiki/NetHack
* http://te4.org/wiki/Tales_of_Maj%27Eyal_Wiki
