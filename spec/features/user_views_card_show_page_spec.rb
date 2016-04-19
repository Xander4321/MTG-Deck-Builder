require 'rails_helper'
require 'pry'

feature "User visits card show page" do
  let!(:lotus) {Card.create(
    name: "Black Lotus",
    color_identity: "Colorless",
    mana_cost: "0",
    cmc: 0,
    rarity: "Rare",
    rules_text: "{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool.",
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=382866&type=card"
  )}

  scenario "sees cards details" do
    visit cards_path

    click_on 'Black Lotus'

    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "Casting Cost: 0"
    expect(page).to have_content "Color Identity: Colorless"
    expect(page).to have_content "Rarity: Rare"
    expect(page).to have_content "Rules Text: {T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool."
    expect(page).to have_selector "img[src$='#{lotus.image}']"
  end
end
