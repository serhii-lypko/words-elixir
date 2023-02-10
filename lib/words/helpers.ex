defmodule Words.Helpers do

  @moduledoc """
  Shuffle Array using Random Class

  We can iterate through the array elements in a for loop.
  Then, we use the Random class to generate a random index number.
  Then swap the current index element with the randomly generated index element.
  At the end of the for loop, we will have a randomly shuffled array.
  """
  def shuffle_array(array, index \\ 0) do
    if index == length(array) do
      array
    else
      rand_index = Enum.random(0..length(array) - 1)

      current_el = Enum.at(array, index)
      random_el = Enum.at(array, rand_index)

      updated = array
        |> List.replace_at(index, random_el)
        |> List.replace_at(rand_index, current_el)

      shuffle_array(updated, index + 1)
    end
  end
end
