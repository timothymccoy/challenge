defmodule LawApi.LawsuitController do
  use LawApi.Web, :controller

  alias LawApi.Lawsuit

  def index(conn, _params) do
    lawsuits = Repo.all(Lawsuit) 
    |> Repo.preload(:firm) 
    |> Repo.preload(:defendant) 
    |> Repo.preload(:plaintiff)
    
    render(conn, "index.json", lawsuits: lawsuits)
  end

  def create(conn, %{"lawsuit" => lawsuit_params}) do
    changeset = Lawsuit.changeset(%Lawsuit{}, lawsuit_params)

    case Repo.insert(changeset) do
      {:ok, lawsuit} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", lawsuit_path(conn, :show, lawsuit))
        |> render("show.json", lawsuit: lawsuit)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lawsuit = Repo.get!(Lawsuit, id)
    render(conn, "show.json", lawsuit: lawsuit)
  end

  def update(conn, %{"id" => id, "lawsuit" => lawsuit_params}) do
    lawsuit = Repo.get!(Lawsuit, id)
    changeset = Lawsuit.changeset(lawsuit, lawsuit_params)

    case Repo.update(changeset) do
      {:ok, lawsuit} ->
        render(conn, "show.json", lawsuit: lawsuit)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lawsuit = Repo.get!(Lawsuit, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(lawsuit)

    send_resp(conn, :no_content, "")
  end
end
