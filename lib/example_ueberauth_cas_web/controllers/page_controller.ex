defmodule ExampleUeberauthCasWeb.PageController do
  use ExampleUeberauthCasWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
