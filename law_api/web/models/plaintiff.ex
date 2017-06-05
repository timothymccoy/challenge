defmodule LawApi.Plaintiff do
  use LawApi.Web, :model

  schema "plaintiffs" do
    field :firstname, :string
    field :lastname, :string
    field :gender, :string
    field :dob, Ecto.Date
    has_many :lawsuits, LawApi.Lawsuit #associaition for lawsuit-plaintiff relationship

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :gender, :dob])
    |> validate_required([:firstname, :lastname, :gender, :dob])
  end
end
