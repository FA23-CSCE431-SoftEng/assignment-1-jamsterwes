require 'rails_helper'

RSpec.describe Book, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'is valid when it has a title' do
    book = Book.new
    book.title = 'Test Title'
    expect(book.valid?).to eq(true)
  end

  it 'is NOT valid when it does NOT have a title' do
    book = Book.new
    expect(book.valid?).to eq(false)
  end
end
