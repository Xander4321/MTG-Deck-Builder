require 'rails_helper'

feature "User visits decks path" do

  let!(:deckstyle) { Deckstyle.create(
    name: "Commander/EDH",
    cardlmt: 100
  ) }

  scenario "creates a new deck successfully" do
    visit decks_path

    fill_in 'Name', with: 'This is a Deck'
    select 'Commander/EDH', from: 'Format'

    click_on 'Add New Deck'

    expect(page).to have_content 'Decks'
    expect(page).to have_content 'This is a Deck'
  end

  scenario "creates a new deck successfully" do
    visit decks_path

    fill_in 'Name', with: 'This is a Deck'
    select 'Commander/EDH', from: 'Format'

    click_on 'Add New Deck'

    expect(page).to have_content('Decks', count: 2)
    expect(page).to have_content 'This is a Deck'
  end
end
