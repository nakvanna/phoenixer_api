defmodule PhoenixerApiWeb.Graphql.Middleware do
  @behaviour Absinthe.Middleware

  def call(resolution, role) do

    with %{current_user: current_user} <- resolution.context, true <- correct_role?(current_user, role) do
      resolution
    else
      _ -> Absinthe.Resolution.put_result(resolution, {:error, "Unauthorized"})
    end
  end

  defp correct_role?(%{}, :any), do: true
  defp correct_role?(%{role: role}, role), do: true
  defp correct_role?(_, _), do: false
  #  def call(resolution, role) do
  #    case resolution.context do
  #      %{current_user: _} -> resolution
  #
  #      _ ->
  #        resolution
  #        |> Absinthe.Resolution.put_result({:error, "unauthenticated"})
  #    end
  #  end
end