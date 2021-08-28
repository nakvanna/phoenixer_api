defmodule PhoenixerApiWeb.Schema.InputTypes.User do
  use Absinthe.Schema.Notation

  input_object :create_user_input_type do
    field :name, non_null(:string)
    field :username, non_null(:string)
    field :email, non_null(:string)
    field :hash_password, non_null(:string)
  end

  input_object :update_user_input_type do
    field :name, :string
    field :username, :string
    field :email, :string
    field :hash_password, :string
    field :role, :string
    field :verify, :boolean
  end
end