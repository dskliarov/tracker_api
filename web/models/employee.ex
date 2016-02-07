defmodule Tracker.Employee do
  use Tracker.Web, :model

  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :department_id, :integer
    field :inactive, :boolean, default: false

    timestamps
  end

  @required_fields ~w(first_name last_name department_id inactive)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
