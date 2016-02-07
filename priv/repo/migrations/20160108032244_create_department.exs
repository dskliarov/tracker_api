defmodule Tracker.Repo.Migrations.CreateDepartment do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string
      add :inactive, :boolean, default: false

      timestamps
    end

  end
end
