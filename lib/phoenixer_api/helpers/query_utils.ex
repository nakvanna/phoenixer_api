defmodule PhoenixerApi.Helpers.QueryUtil do
  import Ecto.Query, warn: false

  def list_record(args \\ {}) do
    Enum.reduce(
      args.condition,
      dynamic(true),
      fn {key, value}, dynamic ->
        [field_string, operation] = String.split(key, ["-"])
        case operation do
          "eq" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) == ^value)
          "neq" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) != ^value)
          "gt" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) > ^value)
          "lt" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) < ^value)
          "gte" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) >= ^value)
          "lte" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) <= ^value)
          "ilike" -> dynamic([p], ^dynamic and ilike(field(p, ^String.to_atom(field_string)), ^"%#{value}%"))
          "like" -> dynamic([p], ^dynamic and like(field(p, ^String.to_atom(field_string)), ^"%#{value}%"))
          "in" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) in ^value)
        end
      end
    )
  end
end