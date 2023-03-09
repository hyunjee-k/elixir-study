defmodule Memo do
  @moduledoc """
    This is where I write down what I'm going to take notes.
  """

  @doc """
  Map 이란?

  ## Memo
      Map
      - key-value 쌍으로 이루어진 컬렉션
      - key는 중복될 수 없다.
      - key는 다양한 타입을 허용한다.
      - pattern matching을 사용할 수 있다. (주어진 값의 부분집합을 사용)
      - key의 순서는 고려하지 않는다.
      - key의 타입을 지정하지 않으면 atom이 된다.

  ## Example

      iex> colors = %{primary: "red", secondary: "blue"}

      iex> colors.primary
      "red"

      iex> %{secondary: second_color} = colors
      %{primary: "red", secondary: "blue"}

      iex> second_color
      "blue"

      iex> %{foo: "bar", hello: "world"}
      %{foo: "bar", hello: "world"}

      iex> %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
      true

  """
  def map_basic do
    colors = %{primary: "red", secondary: "blue"}
  end

  @doc """
  Map 수정하기

  ## Memo
      map의 값을 수정할 때의 두가지 방법
        1. function 사용
          - Map.put(map, key, value)
        2. syntax 사용
          - %{map | key: value}

  ## Example

      iex> colors.primary = "green"
      ** (CompileError) iex:1: cannot invoke remote function colors.primary/0 inside match

      iex> Map.put(colors, :primary, "green")
      %{primary: "green", secondary: "blue"}

      iex> %{ colors | primary: "green"}
      %{primary: "green", secondary: "blue"}

      iex> %{colors | third: "pink"}
      ** (KeyError) key :third not found in: %{primary: "red", secondary: "blue"}

  """
  def update_map do
    colors = %{primary: "red", secondary: "blue"}
    "colors : #{colors}"

    # update by function
    Map.put(colors, :primary, "green")

    # syntax
    %{colors | secondary: "pink"}

  end

  @doc """
  키워드 목록이란?

  ## Memo
    keyword list
      - key는 반드시 atom이어야 한다.
      - key에는 순서가 있다.
      - key는 중복될 수 있다.
      - keyword list에도 패턴 매칭을 사용할 수 있지만, 원소의 개수와 순서가 정확히 매칭되어야 하므로 실제로는 거의 사용하지 않는다.
      - 마지막 인자는 []를 생략할 수 있다.

      키워드 목록의 좋은 사례는 다음과 같습니다.
      query = User.find_where([where: user.age > 10, where: user.subscribed == true])

      이때, 함수의 마지막 인자가 keyword list일 경우 []를 생략할 수 있으므로 다음의 것도 가능합니다.
      query = User.find_where(where: user.age > 10, where: user.subscribed == true)

      또한, 함수의 단일 인자는 ()를 생략할 수 있으므로 다음의 것도 가능합니다.
      query = User.find_where where: user.age > 10, where: user.subscribed == true

  ## Example

      iex> colors = [{:primary, "red"}, {:secondary, "blue"}]
      [primary: "red", secondary: "blue"]

      iex> colors[:primary]
      "red"

      iex> colors ++ [{:third, "pink"}]
      [primary: "red", secondary: "blue", third: "pink"]

      iex> [{:zero, "while"}] ++ colors
      [zero: "while", primary: "red", secondary: "blue", third: "pink"]

  """
  def kewords_list do
    colors = [{:primary, "red"}, {:secondary, "blue"}]

  end


end