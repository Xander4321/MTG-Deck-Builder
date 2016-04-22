class DecksController < ApplicationController
  def index
    @deck = Deck.new
    @decks = Deck.all
    @deckstyle = Deckstyle.all
  end

  def show
    deck
    @cards = @deck.cards.select('cards.*, deckcards.num_of as num_of')
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      flash[:notice] = "Deck added successfully!"
      redirect_to decks_path 
    else
      flash[:error] = "Deck not added successfully! #{@deck.errors.full_messages.join ', '}."
      render :index
    end
  end

  private

  def deck
    @deck ||= Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name, :deckstyle_id)
  end
end
