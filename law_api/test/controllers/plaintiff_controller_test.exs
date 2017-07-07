defmodule LawApi.PlaintiffControllerTest do
  use LawApi.ConnCase

  alias LawApi.Plaintiff
  @valid_attrs %{dob: %{day: 17, month: 4, year: 2010}, firstname: "some content", gender: "some content", lastname: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, plaintiff_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    plaintiff = Repo.insert! %Plaintiff{}
    conn = get conn, plaintiff_path(conn, :show, plaintiff)
    assert json_response(conn, 200)["data"] == %{"id" => plaintiff.id,
      "firstname" => plaintiff.firstname,
      "lastname" => plaintiff.lastname,
      "gender" => plaintiff.gender,
      "dob" => plaintiff.dob}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, plaintiff_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, plaintiff_path(conn, :create), plaintiff: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Plaintiff, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, plaintiff_path(conn, :create), plaintiff: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    plaintiff = Repo.insert! %Plaintiff{}
    conn = put conn, plaintiff_path(conn, :update, plaintiff), plaintiff: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Plaintiff, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    plaintiff = Repo.insert! %Plaintiff{}
    conn = put conn, plaintiff_path(conn, :update, plaintiff), plaintiff: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    plaintiff = Repo.insert! %Plaintiff{}
    conn = delete conn, plaintiff_path(conn, :delete, plaintiff)
    assert response(conn, 204)
    refute Repo.get(Plaintiff, plaintiff.id)
  end
end
