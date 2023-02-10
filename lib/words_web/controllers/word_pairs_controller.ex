defmodule WordsWeb.WordPairsController do
  use WordsWeb, :controller

  alias Words.WordPairs
  # alias Words.WordPairs.WordPair

  def all(conn, _params) do
    # word_pairs = WordPairs.read_all()
    word_pairs = WordPairs.shuffle()

    # TODO: total_learned should be placed somewhere on
    # header level
    total_learned = length(WordPairs.read_learned())

    render(
      conn,
      "all_pairs.html",
      pairs: word_pairs,
      total_learned: total_learned
    )
  end

end
