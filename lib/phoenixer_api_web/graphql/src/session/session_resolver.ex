defmodule PhoenixerApiWeb.Schema.Resolvers.Session do
  use Absinthe.Schema.Notation
  alias PhoenixerApi.{Accounts, Guardian}

  object :session_mutations do
    field :login, :session do
      arg :data, non_null(:create_session_input)

      resolve(
        fn args, _ ->
          with {:ok, user} <- Accounts.login_user(args.data), {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
            {:ok, %{token: jwt_token, user: user}}
          end
        end
      )
    end
  end
end