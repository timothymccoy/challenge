defmodule LawApi.FirmView do
  use LawApi.Web, :view

  def render("index.json", %{firms: firms}) do
    %{data: render_many(firms, LawApi.FirmView, "firm.json")}
  end

  def render("show.json", %{firm: firm}) do
    %{data: render_one(firm, LawApi.FirmView, "firm.json")}
  end

  def render("firm.json", %{firm: firm}) do
    %{id: firm.id,
      name: firm.name,
      email: firm.email,
      street: firm.street,
      city: firm.city,
      state: firm.state,
      zip: firm.zip}
  end
end
