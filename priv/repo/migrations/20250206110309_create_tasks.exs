defmodule TodoappBackend.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :text, :string
      add :status, :boolean, default: false, null: false
      add :due_date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
