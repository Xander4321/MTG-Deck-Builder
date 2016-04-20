require 'rails_helper'

feature "User visits card show page" do
  let!(:supertype) { Supertype.create(sptypname: "Legendary") }
  let!(:type) { Type.create(typname: "Artifact") }
  let!(:subtype) { Subtype.create(sbtypname: "Flower") }
  let!(:artist) { Artist.create(name: "Chris Rahn", gender: "Male") }
  let!(:expantion) { Expantion.create(
    name: "Vintage Masters",
    symbol: "http://www.spllbk.com/assets/symbol/set/vma/c-6d1ef3b0f14cc7303384465017de6907.svg",
    total: 325
  ) }

  let!(:lotus) { Card.create(
    name: "Black Lotus",
    color_identity: "Colorless",
    mana_cost: "0",
    cmc: 0,
    rarity: "Rare",
    rules_text: "{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool.",
    flavor_text: "Power that transcends Legend.",
    image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=382866&type=card",
    supertype: supertype,
    type: type,
    subtype: subtype,
    artist: artist,
    expantion: expantion,
    number: 4
  ) }

  scenario "sees cards details" do
    visit cards_path

    click_on 'Black Lotus'

    expect(page).to have_content("Black Lotus", count: 2)
    expect(page).to have_content "Casting Cost: 0"
    expect(page).to have_content "Color Identity: Colorless"
    expect(page).to have_content "Rarity: Rare"
    expect(page).to have_content "Rules Text: {T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool."
    expect(page).to have_selector "img[src$='#{lotus.image}']"
    expect(page).to have_content "Type: Legendary Artifact - Flower"
    expect(page).to have_content "Artist: Chris Rahn"
    expect(page).to have_content "Set: Vintage Masters"
    expect(page).to have_selector "img[src$='#{expantion.symbol}']"
    expect(page).to have_content "Card Number: 4/325"
    expect(page).to have_content "Flavor Text: Power that transcends Legend."
  end
end
