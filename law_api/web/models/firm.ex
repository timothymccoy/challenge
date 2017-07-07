defmodule LawApi.Firm do
  use LawApi.Web, :model

  schema "firms" do
    field :name, :string
    field :email, :string
    field :street, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    has_many :lawsuits, LawApi.Lawsuit #associaition for lawsuit-firm relationship

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :street, :city, :state, :zip])
    |> validate_required([:name, :email, :street, :city, :state, :zip])
  end
end
