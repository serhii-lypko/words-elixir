defmodule WordsWeb.WordPairsController do
  use WordsWeb, :controller

  alias Words.WordPairs
  # alias Words.WordPairs.WordPair

  def index(conn, _params) do
    word_pairs = WordPairs.shuffle()

    render(
      conn,
      "index.html",
      pairs: word_pairs,
    )
  end

  def show(conn, _params) do
    render(
      conn,
      "show.html"
    )
  end

  def update(conn, %{"id" => id}) do
    WordPairs.toggle_is_learned(id)
    redirect(conn, to: "/")
  end

  def learned(conn, _params) do
    learned_pairs = WordPairs.read_learned()

    render(
      conn,
      "learned.html",
      pairs: learned_pairs
    )
  end
end
