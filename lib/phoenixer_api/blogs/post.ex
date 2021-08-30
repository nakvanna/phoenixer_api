defmodule PhoenixerApi.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :status, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:status, :title, :content, :user_id])
    |> validate_required([:status, :title, :content, :user_id])
  end
end
