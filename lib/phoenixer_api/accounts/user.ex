defmodule PhoenixerApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :hash_password, :string
    field :username, :string
    field :role, :string, default: "user"
    field :verify, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :hash_password, :role, :verify])
    |> validate_required([:name, :username, :email, :hash_password, :role, :verify])
    |> unique_constraint(:username, message: "Username already taken!")
    |> unique_constraint(:email, message: "Email already taken!")
  end
end
