defmodule Tracker.EmployeeController do
  use Tracker.Web, :controller

  alias Tracker.Employee

  plug :scrub_params, "employee" when action in [:create, :update]

  def index(conn, _params) do
    employees = Repo.all(Employee)
    render(conn, "index.json", employees: employees)
  end

  def create(conn, %{"employee" => employee_params}) do
    changeset = Employee.changeset(%Employee{}, employee_params)

    case Repo.insert(changeset) do
      {:ok, employee} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", employee_path(conn, :show, employee))
        |> render("show.json", employee: employee)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Repo.get!(Employee, id)
    render(conn, "show.json", employee: employee)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Repo.get!(Employee, id)
    changeset = Employee.changeset(employee, employee_params)

    case Repo.update(changeset) do
      {:ok, employee} ->
        render(conn, "show.json", employee: employee)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Repo.get!(Employee, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(employee)

    send_resp(conn, :no_content, "")
  end
end
