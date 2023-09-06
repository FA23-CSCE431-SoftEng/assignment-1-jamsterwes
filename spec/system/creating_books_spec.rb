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
    # TODO: add rest

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
  it 'should not create a book with NO title' do
    # Go to page
    visit '/books/new'

    # Don't! fill out form
    # TODO: add rest

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end

  # Rainy day
  it 'should not create a book with NO author' do
    # Go to page
    visit '/books/new'

    # Don't! fill out form
    fill_in 'Title', with: 'Breaking Bad'
    fill_in 'Price', with: '0.99'
    select '2013/09/29', from: 'Date'

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end

  # Rainy day
  it 'should not create a book with NO price' do
    # Go to page
    visit '/books/new'

    # Don't! fill out form
    fill_in 'Title', with: 'Breaking Bad'
    fill_in 'Author', with: 'Vince Gilligan'
    select '2013/09/29', from: 'Date'

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end

  # Rainy day
  it 'should not create a book with NO date' do
    # Go to page
    visit '/books/new'

    # Don't! fill out date
    fill_in 'Title', with: 'Breaking Bad'
    fill_in 'Author', with: 'Vince Gilligan'
    fill_in 'Price', with: '0.99'
    
    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end
end
