defmodule LawApi.DefendantControllerTest do
  use LawApi.ConnCase

  alias LawApi.Defendant
  @valid_attrs %{dob: %{day: 17, month: 4, year: 2010}, firstname: "some content", gender: "some content", lastname: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, defendant_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    defendant = Repo.insert! %Defendant{}
    conn = get conn, defendant_path(conn, :show, defendant)
    assert json_response(conn, 200)["data"] == %{"id" => defendant.id,
      "firstname" => defendant.firstname,
      "lastname" => defendant.lastname,
      "gender" => defendant.gender,
      "dob" => defendant.dob}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, defendant_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, defendant_path(conn, :create), defendant: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Defendant, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, defendant_path(conn, :create), defendant: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    defendant = Repo.insert! %Defendant{}
    conn = put conn, defendant_path(conn, :update, defendant), defendant: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Defendant, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    defendant = Repo.insert! %Defendant{}
    conn = put conn, defendant_path(conn, :update, defendant), defendant: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    defendant = Repo.insert! %Defendant{}
    conn = delete conn, defendant_path(conn, :delete, defendant)
    assert response(conn, 204)
    refute Repo.get(Defendant, defendant.id)
  end
end
