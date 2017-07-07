defmodule LawApi.FirmControllerTest do
  use LawApi.ConnCase

  alias LawApi.Firm
  @valid_attrs %{city: "some content", email: "some content", name: "some content", state: "some content", street: "some content", zip: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, firm_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    firm = Repo.insert! %Firm{}
    conn = get conn, firm_path(conn, :show, firm)
    assert json_response(conn, 200)["data"] == %{"id" => firm.id,
      "name" => firm.name,
      "email" => firm.email,
      "street" => firm.street,
      "city" => firm.city,
      "state" => firm.state,
      "zip" => firm.zip}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, firm_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, firm_path(conn, :create), firm: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Firm, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, firm_path(conn, :create), firm: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    firm = Repo.insert! %Firm{}
    conn = put conn, firm_path(conn, :update, firm), firm: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Firm, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    firm = Repo.insert! %Firm{}
    conn = put conn, firm_path(conn, :update, firm), firm: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    firm = Repo.insert! %Firm{}
    conn = delete conn, firm_path(conn, :delete, firm)
    assert response(conn, 204)
    refute Repo.get(Firm, firm.id)
  end
end
