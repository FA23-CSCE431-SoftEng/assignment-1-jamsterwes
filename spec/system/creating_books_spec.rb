require 'rails_helper'

def select_date(year, month, day, id)
  select year, from: id + '_1i'
  select month, from: id + '_2i'
  select day, from: id + '_3i'
end

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
    fill_in 'Author', with: 'Vince Gilligan'
    fill_in 'Price', with: '0.99'
    # select '2013/09/29', from: 'Published Date'
    select_date '2013', 'September', '29', 'book_published_date'

    # Click submit
    click_on 'Create Book'

    # Expect book in list
    expect(page).to have_content('Breaking Bad')

    # Expect flash notice (happy)
    expect(page).to have_content('Book has been created!')

    # Expect data in database
    book = Book.order("id").last
    expect(book.title).to eq('Breaking Bad')
    expect(book.author).to eq('Vince Gilligan')
    expect(book.price).to eq(0.99)
    expect(book.published_date).to eq(Date.new(2013, 9, 29))
  end

  # Rainy day
  it 'should not create a book with NO title' do
    # Go to page
    visit '/books/new'

    # Don't! fill out title
    fill_in 'Author', with: 'Vince Gilligan'
    fill_in 'Price', with: '0.99'
    # select '2013/09/29', from: 'Published Date'
    select_date '2013', 'September', '29', 'book_published_date'

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end

  # Rainy day
  it 'should not create a book with NO author' do
    # Go to page
    visit '/books/new'

    # Don't! fill out author
    fill_in 'Title', with: 'Breaking Bad'
    fill_in 'Price', with: '0.99'
    # select '2013/09/29', from: 'Published Date'
    select_date '2013', 'September', '29', 'book_published_date'

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end

  # Rainy day
  it 'should not create a book with NO price' do
    # Go to page
    visit '/books/new'

    # Don't! fill out price
    fill_in 'Title', with: 'Breaking Bad'
    fill_in 'Author', with: 'Vince Gilligan'
    # select '2013/09/29', from: 'Published Date'
    select_date '2013', 'September', '29', 'book_published_date'

    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end

  # Rainy day
  it 'should not create a book from the future' do
    # Go to page
    visit '/books/new'

    # NOTE: user not actually able to not select a date
    # Therefore, trying to pass an future date
    # the reasoning is that a book "not yet published" shouldn't be in user's collection
    fill_in 'Title', with: 'Breaking Bad'
    fill_in 'Author', with: 'Vince Gilligan'
    fill_in 'Price', with: '0.99'
    select_date '2028', 'September', '29', 'book_published_date'
    
    # Click submit
    click_on 'Create Book'

    # Expect flash notice (unhappy)
    expect(page).to have_content('Failed to create book!')
  end
end
