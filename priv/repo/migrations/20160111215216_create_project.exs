defmodule Tracker.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :inactive, :boolean, default: false

      timestamps
    end

  end
end
