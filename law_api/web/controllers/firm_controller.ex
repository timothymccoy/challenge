defmodule LawApi.FirmController do
  use LawApi.Web, :controller

  alias LawApi.Firm

  def index(conn, _params) do
    firms = Repo.all(Firm)
    render(conn, "index.json", firms: firms)
  end

  def create(conn, %{"firm" => firm_params}) do
    changeset = Firm.changeset(%Firm{}, firm_params)

    case Repo.insert(changeset) do
      {:ok, firm} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", firm_path(conn, :show, firm))
        |> render("show.json", firm: firm)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    firm = Repo.get!(Firm, id)
    render(conn, "show.json", firm: firm)
  end

  def update(conn, %{"id" => id, "firm" => firm_params}) do
    firm = Repo.get!(Firm, id)
    changeset = Firm.changeset(firm, firm_params)

    case Repo.update(changeset) do
      {:ok, firm} ->
        render(conn, "show.json", firm: firm)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    firm = Repo.get!(Firm, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(firm)

    send_resp(conn, :no_content, "")
  end
end
