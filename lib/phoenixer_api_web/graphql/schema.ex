defmodule PhoenixerApiWeb.Schema do
  use Absinthe.Schema

  ##Query types
  import_types(
    PhoenixerApiWeb.Schema.Types.{
      User,
      Session,
      Post
      }
  )

  ##Mutation types
  import_types(
    PhoenixerApiWeb.Schema.InputTypes.{
      User,
      Session,
      Post
      }
  )

  ##Resolver type
  import_types(
    PhoenixerApiWeb.Schema.Resolvers.{
      User,
      Session,
      Post
      }
  )

  query do
    import_fields :user_queries
    import_fields :post_queries
  end

  mutation do
    import_fields :session_mutations
    import_fields :user_mutations
    import_fields :post_mutations
  end

end