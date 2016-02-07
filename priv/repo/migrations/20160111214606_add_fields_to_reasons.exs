defmodule Tracker.Repo.Migrations.AddFieldsToReasons do
  use Ecto.Migration

  def change do
    alter table(:reasons) do
      add :project_id, :integer
    end
  end
end
