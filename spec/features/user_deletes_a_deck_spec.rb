require 'rails_helper'

feature "User visits deck index" do
  let!(:deckstyle) { Deckstyle.create(
    name: "Standard",
    cardlmt: 60
  ) }

  let!(:deck) { Deck.create(
    name: "A Deck",
    deckstyle: deckstyle
  ) }

  scenario "deletes a deck" do
    visit decks_path

    expect(page).to have_content 'A Deck'
    expect(page).to have_content('Standard', count: 2)
    expect(page).to have_content '0/60'

    click_on "Delete"

    expect(page).to_not have_content 'A Deck'
    expect(page).to have_content('Standard', count: 1)
    expect(page).to_not have_content '0/60'

  end
end
