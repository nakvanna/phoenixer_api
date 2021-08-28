defmodule PhoenixerApiWeb.Schema do
  use Absinthe.Schema

  ##Query types
  import_types(
    PhoenixerApiWeb.Schema.Types.{User}
  )

  ##Mutation types
  import_types(
    PhoenixerApiWeb.Schema.InputTypes.{User}
  )

  ##Resolver type
  import_types(
    PhoenixerApiWeb.Schema.Resolvers.{User}
  )

  query do
    import_fields :user_queries
  end

  mutation do
    import_fields :user_mutations
  end

end