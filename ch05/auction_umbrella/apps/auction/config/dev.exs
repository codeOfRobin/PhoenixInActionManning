use Mix.Config

config :auction, Auction.Repo, database: "auction",
  username: "test_user",
  password: "workbox-rodeo-forecast-rectify-taxiderm",
  hostname: "localhost",
  port: "5432"
