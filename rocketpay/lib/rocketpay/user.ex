defmodule Rocketpay.User do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key: var de modulo, const, essa define qual o formato do banco
  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :age, :email, :password, :nickname]
  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password_hash, :string
    field :nickname, :string
    field :password, :string, virtual: true
    timestamps()
  end

  # faz validações
  def changeset(params) do
    # Struct vazia
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:nickname])
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end

# :atom -> String constante