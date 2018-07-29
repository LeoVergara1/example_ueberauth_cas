defmodule ExampleUeberauthCasWeb.Router do
  use ExampleUeberauthCasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug ExampleUeberauthCasWeb.Plug.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", ExampleUeberauthCasWeb do
    pipe_through [:browser]

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    delete "/:provider/logout", AuthController, :delete
    get "/:provider/logout", AuthController, :delete
  end

  scope "/", ExampleUeberauthCasWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExampleUeberauthCasWeb do
  #   pipe_through :api
  # end
end
