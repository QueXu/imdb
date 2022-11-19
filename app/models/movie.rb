class Movie < ApplicationRecord
  has_one_attached :poster, dependent: :destroy
end
