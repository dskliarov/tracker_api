defmodule Tracker.EployeeTest do
  use Tracker.ModelCase

  alias Tracker.Eployee

  @valid_attrs %{department_id: 42, first_name: "some content", inactive: true, last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Eployee.changeset(%Eployee{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Eployee.changeset(%Eployee{}, @invalid_attrs)
    refute changeset.valid?
  end
end
