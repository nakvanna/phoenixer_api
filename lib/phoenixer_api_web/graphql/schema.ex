defmodule PhoenixerApiWeb.Schema do
  use Absinthe.Schema
  alias PhoenixerApiWeb.Schema.Resolvers
  ##Query types
  import_types(
    PhoenixerApiWeb.Schema.Types.{User}
  )

  ##Mutation types
  import_types(
    PhoenixerApiWeb.Schema.InputTypes.{User}
  )

  query do
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_users/3)
    end

    field :get_user, :user do
      arg :id, non_null(:id)
      resolve(&Resolvers.User.get_user/3)
    end
  end

  mutation do
    field :create_user, :user do
      arg :name, non_null(:string)
      arg :username, non_null(:string)
      arg :email, non_null(:string)
      arg :hash_password, non_null(:string)

      resolve(&Resolvers.User.create_user/3)
    end
  end

end