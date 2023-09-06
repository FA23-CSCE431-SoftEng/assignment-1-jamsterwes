require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  # Sunny day
  it 'should create a book with valid details' do
    # Go to page
    visit '/books/new'

    # Fill out form
    fill_in 'Title', with: 'Breaking Bad'

    # Click submit
    click_on 'Create Book'

    # Expect book in list
    expect(page).to have_content('Breaking Bad')

    # Expect flash notice (happy)
    expect(page).to have_content('Book has been created!')

    # Expect data in database
    book = Book.order("id").last
    expect(book.title).to eq('Breaking Bad')
  end

  # Rainy day
  it 'should not create a book with invalid details' do
    # Go to page
    visit '/books/new'

    # Don't! fill out form
    # fill_in 'Title', with: 'Breaking Bad'

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end
end
