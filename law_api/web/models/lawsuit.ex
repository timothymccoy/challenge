defmodule LawApi.Lawsuit do
  use LawApi.Web, :model

  schema "lawsuits" do
    field :description, :string
    field :accidentdate, Ecto.Date

    #associations for foreign keys
    belongs_to :firm, LawApi.Firm
    belongs_to :plaintiff, LawApi.Plaintiff
    belongs_to :defendant, LawApi.Defendant

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firm_id, :plaintiff_id, :defendant_id, :description, :accidentdate])
    |> validate_required([:description, :accidentdate, :firm_id])
  end
end