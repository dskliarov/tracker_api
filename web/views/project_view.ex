defmodule Tracker.ProjectView do
  use Tracker.Web, :view

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, Tracker.ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, Tracker.ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      name: project.name,
      description: project.description,
      inactive: project.inactive}
  end
end
