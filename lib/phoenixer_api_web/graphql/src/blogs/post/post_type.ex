defmodule PhoenixerApiWeb.Schema.Types.Post do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias PhoenixerApi.Accounts

  object :post do
    field :id, :id
    field :status, :string
    field :title, :string
    field :content, :string
    field :user_id, :id
    field :success, :boolean
    field :message, :string

    #Relationship
    field :user, :user, resolve: dataloader(Accounts)
  end

end