# Since configuration is shared in umbrella projects, this file
# should only configure the :auction_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :auction_web,
  generators: [context_app: false]

# Configures the endpoint
config :auction_web, AuctionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kJM3kIHPhJkAvKocrOvdwzIRGyz598S4ZrRyp7YtG42ocdeVKWfIIK/nvWOGog6I",
  render_errors: [view: AuctionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuctionWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :auction, ecto_repos: [Auction.Repo]

config :auction, Auction.Repo, database: "auction",
  username: "test_user",
  password: "workbox-rodeo-forecast-rectify-taxiderm",
  hostname: "localhost",
  port: "5432"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
