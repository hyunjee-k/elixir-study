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
      - value 가 짝수인 것만 RGB 값으로 색칠한다.

  """

  @doc """
    Pipeline the process of creating Identicon.
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid

  end

  @doc """
    Hash the input string.

    ## Example
      iex> Identicon.hash_input("hello")
      %Identicon.Image{
        hex: [93, 65, 64, 42, 188, 75, 42, 118, 185, 113, 157, 145, 16, 23, 197, 146],
        color: nil
      }

  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex} # Image struct 에 hex 할당
  end

  def pick_color_example(image) do
    # ===== 설명을 위한 메소드 입니다 =====

    # >> 유의사항
    # red = image.hex[0] 이렇게 접근할 수 없으므로 pattern matching 사용

    # >> pattern matching 사용하기
    %Identicon.Image{hex: hex_list} = image
    [red, green, blue | _tail] = hex_list
    # hex_list 에는 3개 이상의 값이 있으므로 |(파이프)와 _tail 을 사용하여 나머지 값들을 무시한다.
    # 변수명 앞에 _를 붙이면 해당 변수를 사용하지 않겠다는 의미이다.

    # >> 위의 과정 줄이기
    %Identicon.Image{hex: [red, green, blue | _tail]} = image
    # image 를 r, g, b로 분해했다.

    # >> 더 줄이려면 아래 pick_color 함수처럼 인자로 사용하면 된다.
  end

  @doc """
    Pick RGB color from hashed value.

    ## Example
      iex> Identicon.hash_input(image)
      %Identicon.Image{
        hex: [93, 65, 64, 42, 188, 75, 42, 118, 185, 113, 157, 145, 16, 23, 197, 146],
        color: {93, 65, 64}
      }

  """
  def pick_color(%Identicon.Image{hex: [red, green, blue | _tail]} = image) do
    # 함수 인자에서 만든 r/g/b 를 color 에 할당해 구조체를 완성한다.
    %Identicon.Image{image | color: {red, green, blue}}
  end

  @doc """
    Make hashed value to 5x5 grid.

    ## Example
      iex> Identicon.build_grid(image)
      [
        [93, 65, 64, 65, 93],
        [42, 188, 75, 188, 42],
        [42, 118, 185, 118, 42],
        [113, 157, 145, 157, 113],
        [16, 23, 197, 23, 16]
      ]
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3) # Enum(hex, 3) 를 파이프를 통해 표현
    |> Enum.map(&mirror_row/1)
    # Enum.map(some_method): 모든 인자에 대해 some_method 기능을 수행한 뒤 반환 값을 새로운 곳에 채운다.
    # &(함수명)/(인자 수) : 함수에 대한 참조를 전달하기 위해 사용
    |>List.flatten
    # 중첩 리스트를 하나의 리스트로 풀어준다
    # List.flatten([1, 2, [3, 4]]) -> [1, 2, 3, 4]
    |> Enum.with_index
    # index 를 추가하여 리스트를 반환한다.
    # Enum.with_index([1, 2, 3]) -> [{1, 0}, {2, 1}, {3, 2}]
  end

  @doc """
    Mirror the row.
  """
  def mirror_row(rows) do
    # if rows: [93, 65, 64] -> [93, 65, 64, 65, 93]
    [first, second | _tail] = rows
    rows ++ [second, first]
  end

  @doc """
    Filtering odd values in squares.
  """
  def filter_odd_squares(%Identicon.Image{hex: hex} = image) do
    # Enum.filter(grid, fn({value, _index}) -> rem(code, 2) == 0 end)
    # 위 코드를 좀 더 Elixir 스럽게 바꾸면 아래와 같다.
    grid = Enum.filter grid, fn({value, _index}) ->
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end

end

"""
[run code]
> iex -S mix
iex> Identicon.main("hello")
"""
