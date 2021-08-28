defmodule PhoenixerApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :email, :string
      add :hash_password, :string
      add :role, :string
      add :verify, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:username])

  end
end
