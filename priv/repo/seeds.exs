# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tracker.Repo.insert!(%Tracker.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tracker.Repo
alias Tracker.Department
alias Tracker.Employee
alias Tracker.Reason
alias Tracker.Project

#Repo.insert!(%Department{name: "IT Department", inactive: false})
#Repo.insert!(%Department{name: "Finance", inactive: false})
#Repo.insert!(%Department{name: "Engineering", inactive: false})

#Repo.insert!(%Employee{first_name: "First1",last_name: "Last1",department_id: 1, inactive: false})
#Repo.insert!(%Employee{first_name: "First2",last_name: "Last2",department_id: 2, inactive: false})
#Repo.insert!(%Employee{first_name: "First3",last_name: "Last3",department_id: 1, inactive: false})

#Repo.insert!(%Reason{name: "Reason1", description: "Sample reason 1", generic: true, inactive: false})
#Repo.insert!(%Reason{name: "Reason2", description: "Sample reason 2", generic: true, inactive: false})
#Repo.insert!(%Reason{name: "Reason3", description: "Sample reason 3", generic: false, inactive: false})
#Repo.insert!(%Reason{name: "Reason4", description: "Sample reason 4", generic: false, inactive: false})
#Repo.insert!(%Reason{name: "Reason5", description: "Sample reason 5", generic: false, inactive: false})
#Repo.insert!(%Reason{name: "Reason6", description: "Sample reason 6", generic: false, inactive: false})
#Repo.insert!(%Reason{name: "Reason7", description: "Sample reason 7", generic: false, inactive: false})

Repo.insert!(%Project{name: "Project 1", description: "Sample project 1", inactive: false})
Repo.insert!(%Project{name: "Project 2", description: "Sample project 2", inactive: false})
Repo.insert!(%Project{name: "Project 3", description: "Sample project 3", inactive: false})
Repo.insert!(%Project{name: "Project 4", description: "Sample project 4", inactive: false})
Repo.insert!(%Project{name: "Project 5", description: "Sample project 5", inactive: false})
Repo.insert!(%Project{name: "Project 6", description: "Sample project 6", inactive: false})
Repo.insert!(%Project{name: "Project 7", description: "Sample project 7", inactive: false})
Repo.insert!(%Project{name: "Project 8", description: "Sample project 8", inactive: false})
Repo.insert!(%Project{name: "Project 9", description: "Sample project 9", inactive: false})
Repo.insert!(%Project{name: "Project 10", description: "Sample project 10", inactive: false})
Repo.insert!(%Project{name: "Project 11", description: "Sample project 11", inactive: false})

