defmodule EndpointostravaWeb.Router do
  use EndpointostravaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug AuthPlug
  end

  scope "/", EndpointostravaWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", EndpointostravaWeb do
    pipe_through :api

    resources "/users", UsersController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", EndpointostravaWeb do
  #   pipe_through :api
  # end
end
