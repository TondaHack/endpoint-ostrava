defmodule AuthPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    token = "token"

    case get_req_header(conn, "token") do
      [^token] ->
        conn

      _ ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, "UnAuthorized")
        |> halt
    end
  end
end
