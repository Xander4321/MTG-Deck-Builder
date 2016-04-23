require 'rails_helper'

feature "User views deck index" do
  let!(:deckstyle) { Deckstyle.create(
    name: "Commander/EDH",
    cardlmt: 100
  ) }

  scenario "creates and updates deck." do
    visit decks_path

    fill_in 'Name', with: 'This is a Deck'
    select 'Commander/EDH', from: 'Format'

    click_on 'Submit'

    expect(page).to have_content 'Decks'
    expect(page).to have_content 'This is a Deck'
    expect(page).to have_content 'Commander/EDH'
    expect(page).to have_content '0/100'

    click_on 'Edit'

    fill_in 'Name', with: 'Another Deck'

    click_on 'Submit'

    expect(page).to have_content 'Decks'
    expect(page).to have_content 'Another Deck'
    expect(page).to have_content 'Commander/EDH'
    expect(page).to have_content '0/100'
  end
end
