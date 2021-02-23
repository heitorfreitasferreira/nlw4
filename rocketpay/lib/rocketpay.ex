defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: UserCreate

  # Criando uma faixada para quem for usar a aplicação, ai ao invés de usar Rocketpay.User.Create e os escambal, pra criar um user só usa
  # Rocketpay.create_user()

  defdelegate create_user(params), to: UserCreate, as: :call
end
