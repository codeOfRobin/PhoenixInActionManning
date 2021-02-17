defmodule AuctionTest do
  use ExUnit.Case
  alias Auction.{Item, Repo}
  import Ecto.Query
  doctest Auction

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "the truth" do
    assert true
  end

  describe "list_items" do
    setup do
      {:ok, item1} = Repo.insert(%Item{title: "Item 1"})
      {:ok, item2} = Repo.insert(%Item{title: "Item 2"})
      {:ok, item3} = Repo.insert(%Item{title: "Item 3"})
      %{items: [item1, item2, item3]}
    end

    test "returns all Items in the database", %{items: items} do
      assert items == Auction.list_items()
    end
  end

  describe "get_item/1" do
    setup do
      {:ok, item1} = Repo.insert(%Item{title: "Item 1"})
      {:ok, item2} = Repo.insert(%Item{title: "Item 2"})
      %{items: [item1, item2]}
    end

    test "returns a single Item based on id", %{items: items} do
      item = Enum.at(items, 1)
      assert item == Auction.get_item(item.id)
    end
  end

  describe "insert_item/1" do
    
  end
end
