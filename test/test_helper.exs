ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Tracker.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Tracker.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Tracker.Repo)

