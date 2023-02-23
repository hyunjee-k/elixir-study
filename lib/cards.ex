defmodule Cards do

  def hello do
    "hi there!"
    # return 문을 안써도 마지막 값을 항상 반환한다.
  end

  def create_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

#    # bad example: 2중 반복문
#    cards = for v <- values do
#      for s <- suits do
#        "#{v} of #{s}"
#      end
#    end
#
#    List.flatten(cards)

    # good example: 단일 반복문
    for s <- suits, v <- values do
      "#{v} of #{s}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    # pattern matching을 통해 비교와 할당을 한번에 하는 예시
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> {:error, "file not found"}
      # 그냥 reason이라고 적으면 사용하지 않는 변수라고 warning이 뜬다.
      # _를 붙이면 warning이 뜨지 않는다.
    end

#    * 아래와 같이 if 문으로 예외처리를 하고 싶겠지만 권장하는 패턴이 아님.
#    if status == :ok do
#      :erlang.binary_to_term(binary)
#    else
#      {:error, "file not found"}
#    end
  end

  def create_hand(hand_size) do
    # without pipe operator
    deck = create_deck()
    deck = shuffle(deck)
    {hand, _} = deal(deck, hand_size)
    hand

    # with pipe operator
    create_deck()
    |> shuffle()
    |> deal(hand_size)
    |> elem(0)
  end

  """
  [Elixir 실행]
  >> iex -S mix
  >> recompile

  [Elixir 특징]
  1. return 문을 안써도 마지막 값을 항상 반환한다.

  2. 불변성
    - deck = create_deck() 호출 후 shuffle(deck) 을 해보자.
    - 기존 deck은 변하지 않고 새로운 객체가 생성된다. (복사 후 shuffle)

  3. ?
    - boolean 값을 반환한다.

  4. pattern matching
    - "elixir's replacement for variable assignment"
    - Elixir에서는 변수에 값을 할당할때 매치연산자를 사용하여 좌변과 우변이 매칭될 수 있는지 평가한 후 값을 할당한다.
    - 가능
      - 변수에 재할당 할 떄
      - [red, color] = ["red", "blue"] 할당 후 [red, color] = ["pink", "green"]
    - 불가능
      - 좌/우 개수가 맞지 않을 때
      - [red, color] = ["red", "blue", "green"]
      - 상수에 재할당 할 때
      - ["red", color] = ["red", "color"] 할당 후 ["red", color] = ["pink", "green"]

  5. Elixir 실행 과정 (Erlang, BEAM)
    - 실행 과정: Elixir --(transpiled into)-> Erlang --(compiled & execute)-> BEAM
    - Elixir는 단독으로 실행되는 언어가 아니다.
    - Elixir는 Erlang이란 언어를 편리하게 사용할 수 있도록 인터페이스로 제공하는 것이다.
    - Elixir는 Erlang VM(=BEAM) 위에서 동작한다.
    - Elixir는 Erlang의 라이브러리를 그대로 사용할 수 있다.
    - Elixir는 Erlang의 프로세스 모델을 그대로 사용할 수 있다.
    - BEAM은 Java의 JVM과 같은 역할을 한다.

  6. :atom
    - ex) :erlang, :ok, :error, :enoent, ...
    - :atom은 메모리에 한번만 저장되고, 같은 이름의 :atom은 같은 메모리를 참조한다.
    - :atom은 변경할 수 없다. (immutable)
    - :atom은 문자열보다 빠르다.
    - :atom은 문자열보다 메모리를 적게 사용한다.

  7. _변수명
    - 변수명 앞에 _를 붙이면 사용하지 않는 변수라는 warning이 뜨지 않는다.
    - ex) {:error, _reason} = File.read(file_name)

  8. |> pipe operator
    - 이전의 결과를 첫번째 인자로 받는 함수를 호출할 때 사용한다.
    - ex) create_hand() 의 내용 참고

  """
end
