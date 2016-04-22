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
    else
      flash[:error] = "Deck not added successfully! #{@deck.errors.full_messages.join ', '}."
    end
    redirect_to decks_path
  end

  def destroy
    deck
    if @deck.destroy
      flash[:notice] = "Deck Deleted Successfully"
    end
    redirect_to decks_path
  end

  private

  def deck
    @deck ||= Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name, :deckstyle_id)
  end
end
