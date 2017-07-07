defmodule LawApi.DefendantTest do
  use LawApi.ModelCase

  alias LawApi.Defendant

  @valid_attrs %{dob: %{day: 17, month: 4, year: 2010}, firstname: "some content", gender: "some content", lastname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Defendant.changeset(%Defendant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Defendant.changeset(%Defendant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
