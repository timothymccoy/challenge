defmodule LawApi.PlaintiffView do
  use LawApi.Web, :view

  def render("index.json", %{plaintiffs: plaintiffs}) do
    %{data: render_many(plaintiffs, LawApi.PlaintiffView, "plaintiff.json")}
  end

  def render("show.json", %{plaintiff: plaintiff}) do
    %{data: render_one(plaintiff, LawApi.PlaintiffView, "plaintiff.json")}
  end

  def render("plaintiff.json", %{plaintiff: plaintiff}) do
    %{id: plaintiff.id,
      firstname: plaintiff.firstname,
      lastname: plaintiff.lastname,
      gender: plaintiff.gender,
      dob: plaintiff.dob}
  end
end
