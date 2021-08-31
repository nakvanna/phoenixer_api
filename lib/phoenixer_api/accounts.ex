defmodule PhoenixerApi.Accounts do
  @moduledoc """
  The Accounts context.
  """
  alias PhoenixerApi.Helpers.QueryUtil

  def data() do
    Dataloader.Ecto.new(PhoenixerApi.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  import Ecto.Query, warn: false
  alias PhoenixerApi.Repo

  alias PhoenixerApi.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users(args) do
    User
    |> where(^QueryUtil.query_where(args))
    |> Repo.all()
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert
    |> case  do
         {:error, error} ->
           ##Catch error and get message from unique_constraint
           {_, {message, _}} = List.first(error.errors)
           {:error, message}
         {:ok, user} -> {:ok, Map.merge(user, %{success: true, message: "បង្កើតបានជោគជ័យ!"})}
       end
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def login_user(args) do
    user = User
           |> where(username: ^String.downcase(args.email_or_username))
           |> or_where(email: ^String.downcase(args.email_or_username))
           |> Repo.one
    case check_password(user, args.password) do
      true -> {:ok, user}
      _ -> {:error, %{message: "Incorrect authentication!"}}

    end

  end

  defp check_password(user, password) do
    case user do
      nil -> false
      _ -> Bcrypt.verify_pass(password, user.password_hash)
    end
  end
end
