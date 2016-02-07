defmodule Tracker.Repo.Migrations.CreateEployee do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :first_name, :string
      add :last_name, :string
      add :department_id, :integer
      add :inactive, :boolean, default: false

      timestamps
    end

  end
end
