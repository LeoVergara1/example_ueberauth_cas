defmodule ExampleUeberauthCasWeb.Plug.Auth do

  import Plug.Conn
  import Phoenix.Controller
  require Logger

  def init(_opts) do
  end

  def call(%{private: %{plug_session: current_user}} = conn, _options) do
    case current_user["current_user"] do
      nil ->
        Logger.info ":: Not Logger ::: "
        conn
        |> put_flash(:error, "You need to sign in or sign up before continuing.")
        |> redirect(to: "/auth/cas")
        |> halt()
      _ ->
        conn
        |> put_flash(:ok, "You are sign on")
        |> redirect(to: "/auth/cas")
        |> halt()
    end
  end

  def call(conn, _params) do
    IO.inspect conn
    Logger.info ":: Error  ::: "
    halt(conn)
    conn
  end



end
