defmodule Identicon.Image do

  defstruct hex: nil, color: nil, grid: nil, pixel_map: nil

end

"""

  ## Memo
    - %Identicon.Image{} 를 통해 코드 어디서든 해당 구조체를 사용할 수 있다.

  ## Example
      iex> defmodule Identicon.Image do
      ...>   defstruct hex: nil, color: nil
      ...> end

      iex> %Identicon.Image{}
        %Identicon.Image{hex: nil, color: nil}

      iex> %Identicon.Image{hex: "123456", color: "red"}
        %Identicon.Image{hex: "123456", color: "red"}
"""