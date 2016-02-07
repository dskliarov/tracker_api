defmodule Tracker.Router do
  use Tracker.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tracker do
    pipe_through :api # Use the default browser stack

    resources "employees", EmployeeController, except: [:new, :edit]
    resources "departments", DepartmentController, except: [:new, :edit]
    resources "reasons", ReasonController, except: [:new, :edit]
    resources "projects", ProjectController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tracker do
  #   pipe_through :api
  # end
end
