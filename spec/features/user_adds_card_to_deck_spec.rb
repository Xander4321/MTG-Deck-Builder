require 'rails_helper'

feature "User visits card page" do
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

  scenario "adds card to deck successfully" do
    visit cards_path

    click_on "Black Lotus"

    select 'Mill it All!', from: 'Deck'
    fill_in '# to add', with: 4

    click_on 'Submit'

    expect(page).to have_content "Mill it All!"
    expect(page).to have_content "Black Lotus"
    expect(page).to have_content "4/325"

    visit decks_path

    expect(page).to have_content "4/60"

  end

  scenario "adds card to deck unsuccessfully" do
    visit cards_path

    click_on "Black Lotus"

    click_on 'Submit'

    expect(page).to have_content "Black Lotus not added to Mill it All!! Num of can't be blank"
    expect(page).to have_content "Black Lotus"
  end
end
