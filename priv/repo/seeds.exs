alias TodoappBackend.Todos.Task
alias TodoappBackend.Repo

# Insert seed data
tasks = [
  %Task{
    text: "Buy milk",
    status: false,
    due_date: ~D[2025-01-01]
  },
  %Task{
    text: "Buy eggs",
    status: false,
    due_date: ~D[2025-01-02]
  },
  %Task{
    text: "Buy bread",
    status: false,
    due_date: ~D[2025-01-03]
  }
]

# Insert data into the database
Enum.each(tasks, fn task -> Repo.insert(task) end)

IO.puts("✅ Seed data inserted successfully!")
