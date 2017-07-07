defmodule LawApi.DefendantView do
  use LawApi.Web, :view

  def render("index.json", %{defendants: defendants}) do
    %{data: render_many(defendants, LawApi.DefendantView, "defendant.json")}
  end

  def render("show.json", %{defendant: defendant}) do
    %{data: render_one(defendant, LawApi.DefendantView, "defendant.json")}
  end

  def render("defendant.json", %{defendant: defendant}) do
    %{id: defendant.id,
      firstname: defendant.firstname,
      lastname: defendant.lastname,
      gender: defendant.gender,
      dob: defendant.dob}
  end
end
