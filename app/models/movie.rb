class Movie < ApplicationRecord
  has_one_attached :poster, dependent: :destroy

  acts_as_taggable_on :categories

  CATEGORIES = [
    'Action', 'Drama', 'Adventure', 'Romance', 'Western', 'Crime', 'History', 'Biography', 'Comedy'
]

end
