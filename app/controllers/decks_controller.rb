class DecksController < ApplicationController
  def index
    @deck = Deck.new
    @decks = Deck.all
    @deckstyle = Deckstyle.all
  end

  def show
    deck
    @cards = @deck.cards.select('cards.*, deckcards.num_of as num_of')
    @deckcard = Deckcard.where deck: @deck
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      flash[:notice] = "#{@deck.name} added successfully!"
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

  def edit
    @deck = Deck.find(params[:id])
    @deckstyle = Deckstyle.all
  end

  def update
    deck
    if @deck.update(deck_params)
      flash[:notice] = "Deck updated successfully!"
    else
      flash[:error] = "Update unsucessful. No changes were made."
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
