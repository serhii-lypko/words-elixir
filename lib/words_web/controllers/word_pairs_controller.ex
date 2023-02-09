defmodule WordsWeb.WordPairsController do
  use WordsWeb, :controller

  alias Words.WordPairs
  # alias Words.WordPairs.WordPair

  def all(conn, _params) do
    word_pairs = WordPairs.read_all()
    render(conn, "all_pairs.html", pairs: word_pairs)
  end
end
