defmodule LawApi.Repo.Migrations.CreateLawsuit do
  use Ecto.Migration

  def change do
    create table(:lawsuits) do
      add :firm_id, references(:firms, on_delete: :nothing)
      add :description, :text
      add :accidentdate, :date
      # set up foreign-key references
      add :plaintiff_id, references(:plaintiffs, on_delete: :nothing)
      add :defendant_id, references(:defendants, on_delete: :nothing)

      #generate inserted_at/updated_at columns
      timestamps()
    end

  end
end
