defmodule Tracker.ReasonTest do
  use Tracker.ModelCase

  alias Tracker.Reason

  @valid_attrs %{description: "some content", generic: true, inactive: true, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reason.changeset(%Reason{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reason.changeset(%Reason{}, @invalid_attrs)
    refute changeset.valid?
  end
end
