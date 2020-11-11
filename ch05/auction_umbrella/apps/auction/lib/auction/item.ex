defmodule Auction.Item do
  use Ecto.Schema

  @changeset_validating_fields [:title, :description, :ends_at]

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> Ecto.Changeset.cast(params, @changeset_validating_fields)
    |> Ecto.Changeset.validate_required(:title)
    |> Ecto.Changeset.validate_lenght(:title, min: 3)
  end
end
