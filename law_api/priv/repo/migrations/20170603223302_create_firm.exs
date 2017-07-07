defmodule LawApi.Repo.Migrations.CreateFirm do
  use Ecto.Migration

  def change do
    create table(:firms) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :street, :string, null: false
      add :city, :string, null: false
      add :state, :string, null: false
      add :zip, :string, null: false

      #generate inserted_at/updated_at columns
      timestamps()
    end

  end
end
