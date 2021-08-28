defmodule PhoenixerApiWeb.PageController do
  use PhoenixerApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
