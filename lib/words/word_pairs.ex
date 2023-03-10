defmodule Words.WordPairs do

  alias Words.WordPairs.WordPair
  alias Words.Repo
  alias Words.Helpers

  import Ecto.Query

  def extract_content(pairs) do
    # Enum.map(pairs, fn wp -> Map.take(wp, [:eng, :ru]) end)
    for pair <- pairs do Map.take(pair, [:id, :eng, :ru, :learned]) end
  end

  def read_all() do
    Repo.all(WordPair)
  end

  def read(is_learned \\ false) do
    query = from word_pair in WordPair,
      where: word_pair.learned == ^is_learned

    Repo.all(query)
  end

  def read_learned() do
    read(true)
  end

  def count_learned() do
    length(read_learned())
  end

  def shuffle() do
    read
      |> extract_content
      |> Helpers.shuffle_array
  end

  # --- --- --- --- --- --- --- --- --- ---

  def create(params) do
    # WordPairs.create(%{ eng: "", ru: ""})
    %WordPair{}
    |> WordPair.changeset(params)
    |> Repo.insert()
  end

  def toggle_is_learned(id) do
    pair = Repo.get(WordPair, id)

    next_state = if pair.learned, do: false, else: true
    pair = Ecto.Changeset.change pair, learned: next_state

    Repo.update(pair)
  end

  def delete(id) do
    word_pair = Repo.get(WordPair, id)
    Repo.delete(word_pair)
  end
end
