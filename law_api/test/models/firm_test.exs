defmodule LawApi.FirmTest do
  use LawApi.ModelCase

  alias LawApi.Firm

  @valid_attrs %{city: "some content", email: "some content", name: "some content", state: "some content", street: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Firm.changeset(%Firm{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Firm.changeset(%Firm{}, @invalid_attrs)
    refute changeset.valid?
  end
end
