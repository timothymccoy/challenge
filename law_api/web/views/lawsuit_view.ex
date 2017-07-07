defmodule LawApi.LawsuitView do
  use LawApi.Web, :view

  def render("index.json", %{lawsuits: lawsuits}) do
    %{data: render_many(lawsuits, LawApi.LawsuitView, "lawsuit.json")}
  end

  def render("show.json", %{lawsuit: lawsuit}) do
    %{data: render_one(lawsuit, LawApi.LawsuitView, "lawsuit.json")}
  end

  def render("lawsuit.json", %{lawsuit: lawsuit}) do
    %{id: lawsuit.id,
      firm_id: lawsuit.firm_id,
      description: lawsuit.description,
      accidentdate: lawsuit.accidentdate,
      plaintiff_id: lawsuit.plaintiff_id,
      defendant_id: lawsuit.defendant_id}
  end
end
