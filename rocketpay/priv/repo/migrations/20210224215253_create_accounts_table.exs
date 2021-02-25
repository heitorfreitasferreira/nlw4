defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      add :balance, :decimal #:decimal é para lidar com valores monetários, é melhor q float para isso
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
    # contrstraint, lógica dentro da tabela
    create constraint(:accounts, :balance_must_be_positive_or_zero, check: "balance >= 0")

  end
end
