defmodule PhoenixerApiWeb.Schema.Resolvers.User do
  use Absinthe.Schema.Notation
  alias PhoenixerApi.Accounts

  object :user_queries do
    field :users, list_of(:user) do
      middleware PhoenixerApiWeb.Graphql.Middleware, "user"
      resolve(
        fn _args, _ -> {:ok, Accounts.list_users} end
      )
    end

    field :find_user, :user do
      arg :id, :id
      middleware PhoenixerApiWeb.Graphql.Middleware, "user"
      resolve(
        fn args, _ ->
          case Accounts.get_user(args.id) do
            nil -> {:error, "User ID #{args.id} not found!"}
            user -> {:ok, user}
          end
        end
      )
    end
  end

  object :user_mutations do
    field :create_user, :user do
      arg :data, non_null(:create_user_input_type)
      resolve(
        fn args, _ ->
          Accounts.create_user(args.data)
        end
      )
    end

    field :update_user, :user do
      arg :id, :id
      arg :data, :update_user_input_type
      middleware PhoenixerApiWeb.Graphql.Middleware, "user"
      resolve(
        fn args, _ ->
          user = Accounts.get_user(args.id)
          if user == nil do
            {:error, %{success: false, message: "No result found to update!"}}
          else
            Accounts.update_user(user, args.data)
          end
        end
      )
    end

    field :delete_user, :user do
      arg :id, :id
      middleware PhoenixerApiWeb.Graphql.Middleware, "user"
      resolve(
        fn args, _ ->
          user = Accounts.get_user(args.id)
          if user == nil do
            {:error, %{success: false, message: "No result found to delete!"}}
          else
            Accounts.delete_user(user)
          end
        end
      )
    end
  end

end