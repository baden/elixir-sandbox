defmodule :release_tasks do
  def create do
    # {:ok, _} = Application.ensure_all_started(:sandbox)

    start_applications([:logger, :postgrex, :ecto])
    :ok = Application.load(:sandbox)

    repo = Sandbox.Repo
    info "Creating database for #{inspect repo}.."
    info "Config #{inspect repo.config}.."

    # TODO: Not realy good. Used direct postgres adapter
    # case Ecto.Storage.storage_up(repo.config) do
    case Ecto.Adapters.Postgres.storage_up(repo.config) do
      :ok ->
        info "The database for #{inspect repo} has been created."
      {:error, :already_up} ->
        info "The database for #{inspect repo} has already been created."
      {:error, term} when is_binary(term) ->
        fatal "The database for #{inspect repo} couldn't be created, reason given: #{term}."
      {:error, term} ->
        fatal "The database for #{inspect repo} couldn't be created, reason given: #{inspect term}."
    end
    :init.stop()
  end

  def migrate do
    {:ok, _} = Application.ensure_all_started(:sandbox)

    path = Application.app_dir(:sandbox, "priv/repo/migrations")

    Ecto.Migrator.run(Sandbox.Repo, path, :up, all: true)

    :init.stop()
  end

  defp start_applications(apps) do
    Enum.each(apps, fn app ->
      {:ok, _} = Application.ensure_all_started(app)
    end)
  end

  defp info(message) do
    IO.puts(message)
  end

  defp fatal(message) do
    IO.puts :stderr, message
    System.halt(1)
  end
end
