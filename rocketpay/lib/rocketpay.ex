defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: UserCreate
  alias Rocketpay.Accounts.{Deposit, Withdraw}

  # Criando uma faixada para quem for usar a aplicação, ai ao invés de usar Rocketpay.User.Create e os escambal, pra criar um user só usa
  # Rocketpay.create_user()

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
end
