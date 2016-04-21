require 'rails_helper'

feature "User visits the deck index" do
  let!(:deckstyle) { Deckstyle.create(
    name: "Standard",
    cardlmt: 60
  ) }

  let!(:deck) { Deck.create(
    name: "Mill it All!",
    deckstyle: deckstyle
  ) }

  scenario "sees a list of decks" do
    visit decks_path

    expect(page).to have_content "Decks"
    expect(page).to have_content "Name"
    expect(page).to have_content "Mill it All!"
    expect(page).to have_content "Format"
    expect(page).to have_content "Standard"
    expect(page).to have_content "Card Total"
    expect(page).to have_content "/60"
  end
end
