class CardsController < ApplicationController
  def index
    if params[:query] == ""
      flash[:error] = "Please enter a search term."
      @cards = Card.order(name: :asc)
    elsif params[:query].present?
      @cards = Card.search("%" + params[:query] + "%")
    else
      @cards = Card.order(name: :asc)
    end
  end

  def show
    @card = Card.find(params[:id])
    @deck = Deck.all
    @deckcard = Deckcard.new
  end
end
