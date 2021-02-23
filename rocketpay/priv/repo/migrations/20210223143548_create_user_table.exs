# Arquivo que vai ter os comandos que executaremos no dB
# Interface direta com o banco de dados
# Não é relacionado a inserção de dados, mas com a definição de como tá o dB
defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  # fica pronta pra ser criada e para ter o rollback
  def change do
    create table :users do
      # aqui é gerado um campo id auto como se fosse assim
      # add :id, :integer

      add :name,  :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()
      #add inserted_at e updated_at
    end
  create unique_index(:users, [:email])
  create unique_index(:users, [:nickname])

  # def up do
    # instruções de criação da tabela na migration
  # end
  # def down do
    # instruções de REVERTER a criação da tabela na migration
  # end
  end
end
