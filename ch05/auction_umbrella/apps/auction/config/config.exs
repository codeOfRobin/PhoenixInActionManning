# Since configuration is shared in umbrella projects, this file
# should only configure the :auction_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :auction, ecto_repos: [Auction.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
