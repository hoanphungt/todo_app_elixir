defmodule TodoappBackendWeb.Schema do
  use Absinthe.Schema

  alias TodoappBackendWeb.TodoResolver

  import_types(Absinthe.Type.Custom)

  object :task do
    field :id, non_null(:id)
    field :text, non_null(:string)
    field :status, :boolean
    field :due_date, :date
  end

  query do
    @desc "List all tasks"
    field :all_tasks, non_null(list_of(non_null(:task))) do
      resolve(&TodoResolver.list_tasks/3)
    end
  end

  mutation do
    @desc "Create a new task"
    field :create_task, :task do
      arg :text, non_null(:string)
      arg :status, :boolean
      arg :due_date, :date

      resolve(&TodoResolver.create_task/3)
    end

    @desc "Update a task"
    field :update_task, :task do
      arg :id, non_null(:id)
      arg :text, :string
      arg :status, :boolean
      arg :due_date, :date

      resolve(&TodoResolver.update_task/3)
    end

    @desc "Delete a task"
    field :delete_task, :task do
      arg :id, non_null(:id)

      resolve(&TodoResolver.delete_task/3)
    end
  end
end
