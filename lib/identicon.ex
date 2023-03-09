defmodule Identicon do

  @moduledoc """
    It takes a string to create a line symmetric Identicon.

  ## Identicon
      - Identicon is a visual representation of a hash value.
      - It is a 5x5 grid of blocks.
      - The first 3 of the hashed numbers are used as RGB.
      - 해싱된 숫자들은 아래의 규칙에 따라 5x5 그리드에 채워진다.
      -  1  2  3  2  1
         4  5  6  5  4
         7  8  9  8  7
        10 11 12 11 10
        13 14 15 14 13

  """

  @doc """
    Pipeline the process of creating Identicon.
  """
  def main(input) do
    input
    |> hash_input

  end

  @doc """
    Hash the input string.
  """
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end

end

"""
[run code]
> iex -S mix
iex> Identicon.main("hello")
"""
