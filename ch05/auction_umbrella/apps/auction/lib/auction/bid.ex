defmodule Auction.Bid do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:amount, :user_id, :item_id]

  schema "bids" do
    field :amount, :integer
    belongs_to :item, Auction.Item
    belongs_to :user, Auction.User
    timestamps()
  end

  def changeset(bid, params \\ %{}) do
    bid
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> assoc_constraint(:item)
    |> assoc_constraint(:user)
  end
end
