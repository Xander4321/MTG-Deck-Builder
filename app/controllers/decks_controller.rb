class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    deck
    # @cards = @deck.cards
    @cards = @deck.cards.select('cards.*, deckcards.num_of as num_of')
  end

  private

  def deck
    @deck ||= Deck.find(params[:id])
  end
end
