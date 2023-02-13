defmodule WordsWeb.WordPairsController do
  use WordsWeb, :controller

  alias Words.WordPairs
  # alias Words.WordPairs.WordPair

  def index(conn, _params) do
    # word_pairs = WordPairs.read_all()
    word_pairs = WordPairs.shuffle()

    # TODO: total_learned should be placed somewhere on
    # header level
    total_learned = length(WordPairs.read_learned())

    render(
      conn,
      "index.html",
      pairs: word_pairs,
      total_learned: total_learned
    )
  end

  def show(conn, _params) do
    render(
      conn,
      "show.html"
    )
  end
end
