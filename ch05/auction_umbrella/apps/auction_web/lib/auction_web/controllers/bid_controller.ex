defmodule AuctionWeb.BidController do
  use AuctionWeb, :controller

  plug :require_logged_in_user

  def create(conn, %{"bid" => %{"amount" => amount}, "item_id" => item_id}) do
    user_id = conn.assigns.user_id
    case Auction.insert_bid(%{"amount" => amount, "user_id" => user_id, "item_id" => item_id}) do
      {:ok, bid} -> redirect(conn, to: Routes.item_path(conn, :show, item_id: bid.item_id))
      {:error, bid} ->
        item = Auction.get_item(item_id)
        render(conn, AuctionWeb.ItemView, "show.html", item: item, bid: bid)
    end
  end

end
