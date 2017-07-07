defmodule LawApi.LawsuitTest do
  use LawApi.ModelCase

  alias LawApi.Lawsuit

  @valid_attrs %{accidentdate: %{day: 17, month: 4, year: 2010}, defendantid: 42, description: "some content", firmid: 42, plaintiffid: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Lawsuit.changeset(%Lawsuit{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Lawsuit.changeset(%Lawsuit{}, @invalid_attrs)
    refute changeset.valid?
  end
end
