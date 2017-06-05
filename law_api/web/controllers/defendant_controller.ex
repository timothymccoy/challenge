defmodule LawApi.DefendantController do
  use LawApi.Web, :controller

  alias LawApi.Defendant

  #GET /api/v1/defendants
  def index(conn, _params) do
    defendants = Repo.all(Defendant)
    render(conn, "index.json", defendants: defendants)
  end

  #POST /api/v1/defendants
  def create(conn, %{"defendant" => defendant_params}) do
    changeset = Defendant.changeset(%Defendant{}, defendant_params)

    #if successful, return :ok atom and created resource data
    case Repo.insert(changeset) do
      {:ok, defendant} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", defendant_path(conn, :show, defendant))
        |> render("show.json", defendant: defendant)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  #GET /api/v1/defendants/id
  def show(conn, %{"id" => id}) do
    defendant = Repo.get!(Defendant, id)
    render(conn, "show.json", defendant: defendant)
  end

  def update(conn, %{"id" => id, "defendant" => defendant_params}) do
    defendant = Repo.get!(Defendant, id)
    changeset = Defendant.changeset(defendant, defendant_params)

    case Repo.update(changeset) do
      {:ok, defendant} ->
        render(conn, "show.json", defendant: defendant)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LawApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    defendant = Repo.get!(Defendant, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(defendant)

    send_resp(conn, :no_content, "")
  end
end
