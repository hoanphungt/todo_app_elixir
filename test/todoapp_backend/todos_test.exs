defmodule TodoappBackend.TodosTest do
  use TodoappBackend.DataCase

  alias TodoappBackend.Todos

  describe "tasks" do
    alias TodoappBackend.Todos.Task

    import TodoappBackend.TodosFixtures

    @invalid_attrs %{status: nil, text: nil, due_date: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Todos.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Todos.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{status: true, text: "some text", due_date: ~D[2025-02-05]}

      assert {:ok, %Task{} = task} = Todos.create_task(valid_attrs)
      assert task.status == true
      assert task.text == "some text"
      assert task.due_date == ~D[2025-02-05]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_task(@invalid_attrs)
    end

    test "update_task/1 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{id: task.id, status: false, text: "some updated text"}

      assert {:ok, %Task{} = task} = Todos.update_task(update_attrs)
      assert task.status == false
      assert task.text == "some updated text"
    end

    test "update_task/1 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_task(Map.put(@invalid_attrs, :id, task.id))
      assert task == Todos.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Todos.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Todos.change_task(task)
    end
  end
end
