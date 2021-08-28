defmodule PhoenixerApiWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
    field :username, :string
    field :email, :string
    field :hash_password, :string
    field :role, :string
    field :verify, :boolean
  end

end