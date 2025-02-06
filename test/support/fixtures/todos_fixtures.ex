defmodule TodoappBackend.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoappBackend.Todos` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        due_date: ~D[2025-02-05],
        status: true,
        text: "some text"
      })
      |> TodoappBackend.Todos.create_task()

    task
  end
end
