defmodule WordsWeb.PageController do
  use WordsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
