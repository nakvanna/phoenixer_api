defmodule PhoenixerApiWeb.Schema do
  use Absinthe.Schema

  ##Query types
  import_types(
    PhoenixerApiWeb.Schema.Types.{
      User,
      Session,
      }
  )

  ##Mutation types
  import_types(
    PhoenixerApiWeb.Schema.InputTypes.{
      User,
      Session,
      }
  )

  ##Resolver type
  import_types(
    PhoenixerApiWeb.Schema.Resolvers.{
      User,
      Session
      }
  )

  query do
    import_fields :user_queries
  end

  mutation do
    import_fields :user_mutations
    import_fields :session_mutations
  end

end