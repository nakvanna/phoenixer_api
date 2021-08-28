defmodule PhoenixerApiWeb.Schema.Resolvers.User do
  use Absinthe.Schema.Notation
  alias PhoenixerApi.Accounts

  def list_users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def get_user(_, %{id: id}, _) do
    IO.inspect id
    user = Accounts.get_user(id)
    case user do
      nil -> {:error, "User ID #{id} not found!"}
      user -> {:ok, user}
    end
  end

  def create_user(_, args, _) do
    Accounts.create_user(args)
  end
end