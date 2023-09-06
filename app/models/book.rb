class Book < ApplicationRecord
  # Validate that the book has a title
  validates :title, presence: true
end
