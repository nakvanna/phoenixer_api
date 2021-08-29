defmodule PhoenixerApiWeb.Schema.InputTypes.Session do
  use Absinthe.Schema.Notation

  input_object :create_session_input do
    field :email_or_username, non_null(:string)
    field :password, non_null(:string)
  end
end