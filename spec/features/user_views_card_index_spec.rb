require 'rails_helper'
require 'pry'

feature "User visits card index page" do
  let!(:type) { Type.create(typname: "Artifact") }

  let!(:lotus) {Card.create(
    name: "Black Lotus",
    color_identity: "Colorless",
    mana_cost: "0",
    cmc: 0,
    type: type,
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=382866&type=card"
  )}

  let!(:timewalk) {Card.create(
    name: "Time Walk",
    color_identity: "Blue",
    mana_cost: "BB",
    cmc: 2,
    type: type,
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=383131&type=card"
    )}

  scenario "sees list of cards" do
    visit cards_path

    expect(page).to have_content "Thumbnail"
    expect(page).to have_selector "img[src$='#{lotus.image}']"
    expect(page).to have_selector "img[src$='#{timewalk.image}']"
    expect(page).to have_content "Name"
    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "Time Walk"
    expect(page).to have_content "Color Identity"
    expect(page).to have_content "Colorless"
    expect(page).to have_content "Blue"
    expect(page).to have_content "Mana Cost (CMC)"
    expect(page).to have_content "0 (0)"
    expect(page).to have_content "BB (2)"
    expect(page).to have_content("Artifact", count: 2)
  end
end
