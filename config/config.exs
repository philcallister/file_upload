# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :file_upload,
  ecto_repos: [FileUpload.Repo]

# Configures the endpoint
config :file_upload, FileUploadWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dGPEPZI/TEjFukRj+GxSzBAQh/BHYq7QFTHLOxnKhm0SucTMO9/EHkB7I4iYkHa0",
  render_errors: [view: FileUploadWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FileUpload.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
