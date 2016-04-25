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

  let!(:deckcards) { Deckcard.create(
    card: lotus,
    deck: deck,
    num_of: 1
  ) }

  scenario "edits num_of a card in the deck" do
    visit decks_path

    click_on 'Mill it All!'

    expect(page).to have_content "Mill it All!"
    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "4/325"
    expect(page).to have_content "1"

    fill_in 'num_of', with: '10'

    click_on 'Update'

    expect(page).to have_content "Mill it All!"
    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "4/325"
    expect(page).to have_content("10")
  end
end
