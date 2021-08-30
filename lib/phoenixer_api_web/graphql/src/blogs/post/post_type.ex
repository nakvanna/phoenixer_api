defmodule PhoenixerApiWeb.Schema.Types.Post do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :status, :string
    field :title, :string
    field :content, :string
    field :user_id, :id
    field :success, :boolean
    field :message, :string
  end

end