defmodule Tracker.Repo.Migrations.CreateReason do
  use Ecto.Migration

  def change do
    alter table(:reasons) do
      add :project_id, :integer

      timestamps
    end

  end
end
