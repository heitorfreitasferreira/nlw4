defmodule RocketpayWeb.UsersViewTest do
  alias Rocketpay.{User, Account}
  import Phoenix.View
  use RocketpayWeb.ConnCase, async: true

  test "renders create.json" do
    params = %{
      name: "Heitor",
      password: "123456",
      nickname: "Freitas",
      email: "heitor@email.com",
      age: 20
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(RocketpayWeb.UsersView, "create.json", user: user)

    expected_response = %{
      message: "Usuário criado",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        id: user_id,
        name: "Heitor",
        nickname: "Freitas"
      }
    }

    assert expected_response == response
  end
end
