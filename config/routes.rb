Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # show all tasks
  get "tasks", to: "tasks#index"

  # navigate to new task creator
  get "tasks/new", to: "tasks#new"
  # show specific task
  get "tasks/:id", to: "tasks#show", as: "task"

  # add tasks (1. get to new, 2. post to create)
  post "tasks", to: "tasks#create"

  # edit task (1. get it, 2. update with patch)
  get "tasks/:id/edit", to: "tasks#edit", as: "edit"
  patch "tasks/:id", to: "tasks#update"

  # delete a task
  delete "tasks/:id", to: "tasks#destroy"
end
