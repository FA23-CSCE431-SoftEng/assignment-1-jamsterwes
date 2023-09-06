require 'rails_helper'

RSpec.describe Book, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'is valid when it has all attributes' do
    book = Book.new
    book.title = 'Test Title'
    book.author = 'Vince Gilligan'
    book.price = 0.99
    book.published_date = Date.new(2013, 9, 29)

    expect(book.valid?).to eq(true)
  end

  it 'is NOT valid when it does NOT have a title' do
    book = Book.new
    book.author = 'Vince Gilligan'
    book.price = 0.99
    book.published_date = Date.new(2013, 9, 29)

    expect(book.valid?).to eq(false)
  end

  it 'is NOT valid when it does NOT have a author' do
    book = Book.new
    book.title = 'Test Title'
    book.price = 0.99
    book.published_date = Date.new(2013, 9, 29)

    expect(book.valid?).to eq(false)
  end

  it 'is NOT valid when it does NOT have a price' do
    book = Book.new
    book.title = 'Test Title'
    book.author = 'Vince Gilligan'
    book.published_date = Date.new(2013, 9, 29)

    expect(book.valid?).to eq(false)
  end

  it 'is NOT valid when it does NOT have a date' do
    book = Book.new
    book.title = 'Test Title'
    book.author = 'Vince Gilligan'
    book.price = 0.99
    
    expect(book.valid?).to eq(false)
  end

end
