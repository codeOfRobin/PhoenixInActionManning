use Mix.Config

config :auction, Auction.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "auction_test",
  username: "test_user",
  password: "workbox-rodeo-forecast-rectify-taxiderm",
  hostname: "localhost",
  port: "5432"

config :logger, level: :info
