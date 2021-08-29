defmodule PhoenixerApiWeb.Schema.Types.Session do
  use Absinthe.Schema.Notation

  object :session do
    field :succus, :boolean
    field :message, :string
  end
end