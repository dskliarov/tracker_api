defmodule Tracker.EployeeControllerTest do
  use Tracker.ConnCase

  alias Tracker.Eployee
  @valid_attrs %{department_id: 42, first_name: "some content", inactive: true, last_name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, eployee_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    eployee = Repo.insert! %Eployee{}
    conn = get conn, eployee_path(conn, :show, eployee)
    assert json_response(conn, 200)["data"] == %{"id" => eployee.id,
      "first_name" => eployee.first_name,
      "last_name" => eployee.last_name,
      "department_id" => eployee.department_id,
      "inactive" => eployee.inactive}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, eployee_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, eployee_path(conn, :create), eployee: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Eployee, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, eployee_path(conn, :create), eployee: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    eployee = Repo.insert! %Eployee{}
    conn = put conn, eployee_path(conn, :update, eployee), eployee: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Eployee, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    eployee = Repo.insert! %Eployee{}
    conn = put conn, eployee_path(conn, :update, eployee), eployee: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    eployee = Repo.insert! %Eployee{}
    conn = delete conn, eployee_path(conn, :delete, eployee)
    assert response(conn, 204)
    refute Repo.get(Eployee, eployee.id)
  end
end
