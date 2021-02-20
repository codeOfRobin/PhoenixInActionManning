import Auction.Repo

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Auction.Repo, :manual)
Ecto.Adapters.SQL.Sandbox.mode(Auction.Repo, {:shared, self()})
