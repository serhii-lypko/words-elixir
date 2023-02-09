defmodule Words.Repo.Migrations.AddWordPairs do
  use Ecto.Migration

  def change do
    create table (:word_pairs) do
      add :eng, :string
      add :ru, :string
      add :learned, :boolean

      timestamps()
    end
  end
end
