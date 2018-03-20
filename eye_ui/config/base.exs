use Mix.Config

# Configures the endpoint
config :eye_ui, EyeUiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eKbLRP+c1k0pw8m4hAtAb74UvUIr3cWn3EjmH6+k1SU3Ckhq0YqVGyf+myBpVtKZ",
  render_errors: [view: EyeUiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EyeUi.PubSub,
           adapter: Phoenix.PubSub.PG2]
