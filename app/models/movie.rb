class Movie < ApplicationRecord
  has_one_attached :poster, dependent: :destroy

  CATEGORIES = [
    '', 'Action', 'Drama', 'Adventure', 'Romance', 'Western', 'Crime', 'History', 'Biography', 'Comedy'
]

end
