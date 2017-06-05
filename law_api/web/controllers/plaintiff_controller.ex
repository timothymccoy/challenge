defmodule LawApi.PlaintiffController do
  use LawApi.Web, :controller

  alias LawApi.Plaintiff

  def index(conn, _params) do
    plaintiffs = Repo.all(Plaintiff)
    render(conn, "index.json", plaintiffs: plaintiffs)
  end

  def create(conn, %{"plaintiff" => plaintiff_params}) do
    changeset = Plaintiff.changeset(%Plaintiff{}, plaintiff_params)

    case Repo.insert(changeset) do
      {:ok, plaintiff} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", plaintiff_path(conn, :show, plaintiff))
        |> render("show.json", plaintiff: plaintiff)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plaintiff = Repo.get!(Plaintiff, id)
    render(conn, "show.json", plaintiff: plaintiff)
  end

  def update(conn, %{"id" => id, "plaintiff" => plaintiff_params}) do
    plaintiff = Repo.get!(Plaintiff, id)
    changeset = Plaintiff.changeset(plaintiff, plaintiff_params)

    case Repo.update(changeset) do
      {:ok, plaintiff} ->
        render(conn, "show.json", plaintiff: plaintiff)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plaintiff = Repo.get!(Plaintiff, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(plaintiff)

    send_resp(conn, :no_content, "")
  end
end
