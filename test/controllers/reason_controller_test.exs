defmodule Tracker.ReasonControllerTest do
  use Tracker.ConnCase

  alias Tracker.Reason
  @valid_attrs %{description: "some content", generic: true, inactive: true, name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, reason_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    reason = Repo.insert! %Reason{}
    conn = get conn, reason_path(conn, :show, reason)
    assert json_response(conn, 200)["data"] == %{"id" => reason.id,
      "name" => reason.name,
      "description" => reason.description,
      "generic" => reason.generic,
      "inactive" => reason.inactive}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, reason_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, reason_path(conn, :create), reason: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Reason, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, reason_path(conn, :create), reason: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    reason = Repo.insert! %Reason{}
    conn = put conn, reason_path(conn, :update, reason), reason: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Reason, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    reason = Repo.insert! %Reason{}
    conn = put conn, reason_path(conn, :update, reason), reason: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    reason = Repo.insert! %Reason{}
    conn = delete conn, reason_path(conn, :delete, reason)
    assert response(conn, 204)
    refute Repo.get(Reason, reason.id)
  end
end
