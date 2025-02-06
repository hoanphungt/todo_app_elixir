defmodule TodoappBackendWeb.TodoResolver do
  alias TodoappBackend.Todos

  def list_tasks(_root, _args, _info) do
    {:ok, Todos.list_tasks()}
  end

  def create_task(_root, args, _info) do
    case Todos.create_task(args) do
      {:ok, task} -> {:ok, task}
      {:error} -> {:error, "could not create task"}
    end
  end

  def update_task(_root, args, _info) do
    case Todos.update_task(args) do
      {:ok, task} -> {:ok, task}
      {:error} -> {:error, "could not update task"}
    end
  end

  def delete_task(_root, args, _info) do
    case Todos.delete_task(args) do
      {:ok, task} -> {:ok, task}
      {:error} -> {:error, "could not delete task"}
    end
  end
end
