defmodule WordsWeb.LayoutView do
  use WordsWeb, :view

  alias Words.WordPairs

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def total_learned() do
    WordPairs.count_learned()
  end
end
