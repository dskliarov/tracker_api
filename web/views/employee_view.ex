defmodule Tracker.EmployeeView do
  use Tracker.Web, :view

  def render("index.json", %{employees: employees}) do
    %{data: render_many(employees, Tracker.EmployeeView, "employee.json")}
  end

  def render("show.json", %{employee: employee}) do
    %{data: render_one(employee, Tracker.EmployeeView, "employee.json")}
  end

  def render("employee.json", %{employee: employee}) do
    %{id: employee.id,
      first_name: employee.first_name,
      last_name: employee.last_name,
      department_id: employee.department_id,
      inactive: employee.inactive}
  end
end
