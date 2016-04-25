class DeckcardsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])
    @card_id = @card.id
    a = params[:deckcard]
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

  def update
    @deck = Deck.find(params[:deck_id])
    @deckcard = Deckcard.find(params[:id])
    if @deckcard.update(num_of: params[:num_of])
      flash[:notice] = "Card # successfully updated!"
    else
      flash[:error] = "Something went wrong and card # was not updated."
    end
    redirect_to deck_path(@deck)
  end

  private

  def deckcard_params(card)
    params.require(:deckcard).permit(:num_of, :deck_id).merge(card_id: card)
  end
end
