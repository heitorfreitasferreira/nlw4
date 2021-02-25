defmodule RocketpayWeb.FallbackController do
  use RocketpayWeb, :controller
  # nome call padrao
  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
