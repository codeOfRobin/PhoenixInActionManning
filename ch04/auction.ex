defmodule Auction.Item do
	defstruct id: 0,
			title: "default title", 
			description: "default description", 
			ends_at: ~N[2020-12-31 23:59:59]
end

defmodule Auction.FakeRepo do
	
	alias Auction.Item
	
	@items [
			  %Item{
				id: 1,
				title: "My first item",
				description: "A tasty item sure to please", 
				ends_at: ~N[2020-01-01 00:00:00]
			}, %Item{
				id: 2,
				title: "WarGames Bluray",
				description: "The best computer movie of all time, now on Bluray!", 
				ends_at: ~N[2018-10-15 13:39:35]
			}, %Item{
				id: 3,
				title: "U2 - Achtung Baby on CD",
				description: "The sound of 4 men chopping down The Joshua Tree", 
				ends_at: ~N[2018-11-05 03:12:29]
			}
		]
	
	def all(Item) do
		@items
	end
	
	def get!(Item, id) do
		case Enum.find(@items, fn (%{id: itemID}) -> itemID == id end ) do
			nil -> :error
			element -> element
		end
	end
	
	def get_by(attrs) do
		Enum.find(@items, fn (item) -> do
			Enum.all?(Map.keys(attrs), fn (key) -> do
				Map.get(item, key) == attrs[key]
			end)	
		end)
	end
	
end


defmodule Auction do
	alias Auction.{FakeRepo, Item}
	
	@repo FakeRepo
	
	def list_items() do
		@repo.all(Item)
	end
	
	def get_item(id) do
		@repo.get!(Item, id)
	end
	
	def get_item_by(attrs) do
		@repo.get_by(Item, attrs)
	end
end