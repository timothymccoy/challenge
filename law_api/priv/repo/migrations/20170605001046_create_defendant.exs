defmodule LawApi.Repo.Migrations.CreateDefendant do
  use Ecto.Migration

  def change do
    create table(:defendants) do
      add :firstname, :string
      add :lastname, :string
      add :gender, :string
      add :dob, :date

      #generate inserted_at/updated_at columns
      timestamps()
    end

  end
end
