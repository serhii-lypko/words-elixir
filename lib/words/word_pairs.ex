defmodule Words.WordPairs do

  alias Words.WordPairs.WordPair
  alias Words.Repo

  import Ecto.Query

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

  def create(params) do
    %WordPair{}
    |> WordPair.changeset(params)
    |> Repo.insert()
  end

  def delete(id) do
    word_pair = Repo.get(WordPair, id)
    Repo.delete(word_pair)
  end
end
