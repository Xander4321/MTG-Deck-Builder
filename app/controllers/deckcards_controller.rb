class DeckcardsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])
    @card_id = @card.id
    a = params[:deckcard]
    # binding.pry
    @deck = Deck.find(a["deck_id"])
    @deckcard = Deckcard.new(deckcard_params(@card_id))
    if @deckcard.save
      flash[:notice] = "#{@card.name} added to #{@deck.name} successfully!"
      redirect_to deck_path(@deck)
    else
      flash[:error] = "#{@card.name} not added to #{@deck.name}! #{@deckcard.errors.full_messages.join ', '}."
      redirect_to card_path(@card)
    end
  end

  private

  def deckcard_params(card)
    params.require(:deckcard).permit(:num_of, :deck_id).merge(card_id: card)
  end
end
