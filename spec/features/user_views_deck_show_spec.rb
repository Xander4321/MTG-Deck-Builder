require 'rails_helper'

feature "User visits deck show" do
  let!(:supertype) { Supertype.create(sptypname: "Legendary") }
  let!(:type) { Type.create(typname: "Artifact") }
  let!(:subtype) { Subtype.create(sbtypname: "Flower") }
  let!(:rarity) { Rarity.create(value: "Rare") }
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
    rarity: rarity,
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

  let!(:deckstyle) { Deckstyle.create(
    name: "Standard",
    cardlmt: 60
  ) }

  let!(:deck) { Deck.create(
    name: "Mill it All!",
    deckstyle: deckstyle
  ) }

  let!(:deckcard) { Deckcard.create(
    deck: deck,
    card: lotus,
    num_of: 1
  ) }

  scenario "sees cards in deck" do
    visit deck_path(deck)

    expect(page).to have_content "Mill it All!"
    expect(page).to have_content "#"
    expect(page).to have_content "1x"
    expect(page).to have_content "Thumbnail"
    expect(page).to have_selector "img[src$='#{lotus.image}']"
    expect(page).to have_content "Name"
    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "Mana Cost(CMC)"
    expect(page).to have_content "0(0)"
    expect(page).to have_content "Color Identity"
    expect(page).to have_content "Colorless"
    expect(page).to have_content "Type"
    expect(page).to have_content "Legendary Artifact - Flower"
    expect(page).to have_content "Rarity"
    expect(page).to have_content "Rare"
    expect(page).to have_content "Set"
    expect(page).to have_content "Vintage Masters"
    expect(page).to have_selector "img[src$='#{lotus.expantion.symbol}']"
    expect(page).to have_content "Rules Text"
    expect(page).to have_content "{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool."
    expect(page).to have_content "Card #"
    expect(page).to have_content "4/325"
  end
end
