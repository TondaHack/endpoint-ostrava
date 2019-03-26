defmodule EndpointostravaWeb.PageController do
  use EndpointostravaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
