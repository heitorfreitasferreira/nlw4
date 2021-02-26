defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "Quando todos os parâmetros são válidos, retorna um usuário" do
      params = %{
        name: "Heitor",
        password: "123456",
        nickname: "Freitas",
        email: "heitor@email.com",
        age: 20
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)
      assert %User{name: "Heitor", age: 20, id: ^user_id} = user
    end
  end

  test "Quando há parametros inválidos, retorna error" do
    params = %{
      name: "Heitor",
      nickname: "Freitas",
      email: "heitor@email.com",
      age: 15
    }

    {:error, changeset} = Create.call(params)

    expected_response = %{
      age: ["must be greater than or equal to 18"],
      password: ["can't be blank"]
    }

    assert errors_on(changeset) == expected_response
  end
end
