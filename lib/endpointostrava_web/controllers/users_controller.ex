defmodule EndpointostravaWeb.UsersController do
  use EndpointostravaWeb, :controller

  alias EndpointostravaWeb.ErrorView

  @users [
    %{id: 1, name: "John", lastname: "Doe"},
    %{id: 2, name: "Joe", lastname: "Done"},
    %{id: 3, name: "John", lastname: "Doe"}
  ]
  def index(conn, _params) do
    json(conn, @users)
  end

  def show(conn, %{"id" => user_id}) do
    with {:ok, user} <- find_user(user_id) do
      json(conn, user)
    else
      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> put_view(ErrorView)
        |> render(:"404")
    end
  end

  defp find_user(user_id) do
    case Enum.find(@users, fn %{id: id} -> "#{id}" == user_id end) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
