defmodule PhoenixerApiWeb.Schema.Resolvers.Session do
  use Absinthe.Schema.Notation
  alias PhoenixerApi.Accounts

  object :session_mutations do
    field :login, :user do
      arg :data, non_null(:create_session_input)

      resolve(
        fn args, _ ->
          Accounts.login_user(args.data)
        end
      )
    end
  end
end