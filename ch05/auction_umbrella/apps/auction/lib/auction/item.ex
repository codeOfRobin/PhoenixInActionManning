defmodule Auction.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @changeset_validating_fields [:title, :description, :ends_at]

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> cast(params, @changeset_validating_fields)
    |> validate_required(:title)
    |> validate_length(:title, min: 3)
    |> validate_length(:description, max: 200)
    |> validate_change(:ends_at, &validate/2)
  end

  defp validate(:ends_at, ends_at_date) do
    case Date.compare(ends_at_date, DateTime.utc_now()) do
      :lt -> [ends_at: "can't be in the past"]
      _ -> []
    end
  end
end
