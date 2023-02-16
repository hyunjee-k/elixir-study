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

  """
  Elixir 특징
  1. return 문을 안써도 마지막 값을 항상 반환한다.
  2. 불변성
    - deck = create_deck() 호출 후 shuffle(deck) 을 해보자.
    - 기존 deck은 변하지 않고 새로운 객체가 생성된다. (복사 후 shuffle)
  3. ?
    - boolean 값을 반환한다.
  """
end
