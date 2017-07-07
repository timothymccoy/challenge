defmodule LawApi.Repo.Migrations.CreatePlaintiff do
  use Ecto.Migration

  def change do
    create table(:plaintiffs) do
      add :firstname, :string, null: false
      add :lastname, :string, null: false
      add :gender, :string, null: false 
      add :dob, :date, null: false 

      #generate inserted_at/updated_at columns
      timestamps()
    end

  end
end
