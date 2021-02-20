defmodule AuctionWeb.ItemControllerTest do
  use AuctionWeb.ConnCase
  import Auction.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Auction.Repo)
  end

  test "GET /", %{conn: conn} do
    {:ok, _item} = Auction.insert_item(%{title: "test item"})
    conn = Phoenix.ConnTest.get(conn, "/")
    assert html_response(conn, 200) =~ "test item"
  end

  describe "POST /items" do
    test "with valid params, creates a new Item", %{conn: conn} do
      before_count = Enum.count(Auction.list_items())
      post conn, "/items", %{"item" => %{"title" => "Item 1"}}
      assert Enum.count(Auction.list_items()) == before_count + 1
    end

    test "with valid params, redirects to the new Item", %{conn: conn} do
      conn = post conn, "/items", %{"item" => %{"title" => "Item 1"}}
      assert redirected_to(conn) =~ ~r|/items/\d+|
    end
  end
end
