defmodule Words.WordPairs.WordPair do

  use Ecto.Schema
  import Ecto.Changeset

  schema "word_pairs" do
    field :eng, :string
    field :ru, :string
    field :learned, :boolean, default: false

    timestamps()
  end

  def changeset(item, params) do
    item
    |> cast(params, [:eng, :ru, :learned])
  end
end
