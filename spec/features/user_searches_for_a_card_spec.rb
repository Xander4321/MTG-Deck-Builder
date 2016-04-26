require 'rails_helper'

feature "User visits home page" do
  let!(:type) { Type.create(typname: "Artifact") }

  let!(:lotus) {Card.create(
    name: "Black Lotus",
    color_identity: "Colorless",
    mana_cost: "0",
    cmc: 0,
    type: type,
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=382866&type=card"
  )}

  let!(:timewalka) {Card.create(
    name: "A Time Walk",
    color_identity: "Blue",
    mana_cost: "BB",
    cmc: 2,
    type: type,
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=383131&type=card"
    )}

  let!(:timewalkaa) {Card.create(
    name: "AA Time Walk",
    color_identity: "Blue",
    mana_cost: "BB",
    cmc: 2,
    type: type,
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=383131&type=card"
    )}

  let!(:timewalkaaa) {Card.create(
    name: "AAA Time Walk",
    color_identity: "Blue",
    mana_cost: "BB",
    cmc: 2,
    type: type,
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=383131&type=card"
    )}
  scenario "searches for a card" do
    visit cards_path

    expect(page).to_not have_content 'Black Lotus'
    expect(page).to have_content 'A Time Walk'
    expect(page).to have_content 'AA Time Walk'
    expect(page).to have_content 'AAA Time Walk'

    fill_in 'query', with: 'Black Lotus'
    click_on 'Search'

    expect(page).to have_content 'Black Lotus'
    expect(page).to_not have_content 'A Time Walk'
    expect(page).to_not have_content 'AA Time Walk'
    expect(page).to_not have_content 'AAA Time Walk'
  end
end
