defmodule Tracker.ReasonView do
  use Tracker.Web, :view

  def render("index.json", %{reasons: reasons}) do
    %{data: render_many(reasons, Tracker.ReasonView, "reason.json")}
  end

  def render("show.json", %{reason: reason}) do
    %{data: render_one(reason, Tracker.ReasonView, "reason.json")}
  end

  def render("reason.json", %{reason: reason}) do
    %{id: reason.id,
      name: reason.name,
      description: reason.description,
      generic: reason.generic,
      inactive: reason.inactive}
  end
end
