defmodule PhoenixerApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :hash_password, :string
    field :last_name, :string
    field :role, :string
    field :verify, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :hash_password, :role, :verify])
    |> validate_required([:first_name, :last_name, :email, :hash_password, :role, :verify])
  end
end
