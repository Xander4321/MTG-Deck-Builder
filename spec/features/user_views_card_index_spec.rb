require 'rails_helper'
require 'pry'

feature "User visits card index page" do
  let!(:lotus) {Card.create(
    name: "Black Lotus",
    color_identity: "Colorless",
    mana_cost: "0",
    cmc: 0,
    rarity: "Rare"
  )}

  let!(:timewalk) {Card.create(
    name: "Time Walk",
    color_identity: "Blue",
    mana_cost: "BB",
    cmc: 2,
    rarity: "Rare"
    )}

  scenario "sees list of cards" do
    visit cards_path

    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "Time Walk"
    expect(page).to have_content "0"
    expect(page).to have_content "BB"
  end
end
