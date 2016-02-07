defmodule Tracker.Repo.Migrations.CreateReason do
  use Ecto.Migration

  def change do
    create table(:reasons) do
      add :name, :string
      add :description, :string
      add :generic, :boolean, default: false
      add :inactive, :boolean, default: false

      timestamps
    end

  end
end
