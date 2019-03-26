defmodule EndpointostravaWeb.UsersControllerTest do
  use EndpointostravaWeb.ConnCase

  test "GET /api/users", %{conn: conn} do
    response =
      conn
      |> get(Routes.users_path(conn, :index))
      |> json_response(200)

    expected = [
      %{"id" => 1, "name" => "John", "lastname" => "Doe"},
      %{"id" => 2, "name" => "Joe", "lastname" => "Done"},
      %{"id" => 3, "name" => "John", "lastname" => "Doe"}
    ]

    assert response == expected
  end

  test "GET /api/users/1", %{conn: conn} do
    response =
      conn
      |> get(Routes.users_path(conn, :show, 1))
      |> json_response(200)

    expected = %{"id" => 1, "name" => "John", "lastname" => "Doe"}

    assert response == expected
  end

  test "GET /api/users/5", %{conn: conn} do
    assert conn
           |> get(Routes.users_path(conn, :show, 5))
           |> json_response(404)
  end
end
