defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == "hi there!"
  end

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 52
  end

  test "shuffling a deck randomizes the order" do
    deck = Cards.create_deck()
    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end

end

"""
  [test 실행]
    - mix test

  [refute]
    - 실행 결과가 항상 거짓일 때 사용
"""