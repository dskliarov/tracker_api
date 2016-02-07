defmodule Tracker.ReasonController do
  use Tracker.Web, :controller

  alias Tracker.Reason

  plug :scrub_params, "reason" when action in [:create, :update]

  def index(conn, _params) do
    reasons = Repo.all(Reason)
    render(conn, "index.json", reasons: reasons)
  end

  def create(conn, %{"reason" => reason_params}) do
    changeset = Reason.changeset(%Reason{}, reason_params)

    case Repo.insert(changeset) do
      {:ok, reason} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", reason_path(conn, :show, reason))
        |> render("show.json", reason: reason)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reason = Repo.get!(Reason, id)
    render(conn, "show.json", reason: reason)
  end

  def update(conn, %{"id" => id, "reason" => reason_params}) do
    reason = Repo.get!(Reason, id)
    changeset = Reason.changeset(reason, reason_params)

    case Repo.update(changeset) do
      {:ok, reason} ->
        render(conn, "show.json", reason: reason)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reason = Repo.get!(Reason, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reason)

    send_resp(conn, :no_content, "")
  end
end
