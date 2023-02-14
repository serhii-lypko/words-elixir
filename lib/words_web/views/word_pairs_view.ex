defmodule WordsWeb.WordPairsView do
  use WordsWeb, :view

  def get_inverted_status_text(curr_status) do
    if curr_status, do: "Get back", else: "Learn"
  end
end
