defmodule Tracker.DepartmentView do
  use Tracker.Web, :view

  def render("index.json", %{departments: departments}) do
    %{data: render_many(departments, Tracker.DepartmentView, "department.json")}
  end

  def render("show.json", %{department: department}) do
    %{data: render_one(department, Tracker.DepartmentView, "department.json")}
  end

  def render("department.json", %{department: department}) do
    %{id: department.id,
      name: department.name,
      inactive: department.inactive}
  end
end
