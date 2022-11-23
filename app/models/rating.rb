# frozen_string_literal: true

class Rating < ApplicationRecord
  MAX_RATE = 10
  belongs_to :movie, foreign_key: :movie_id, inverse_of: :ratings
  belongs_to :user, foreign_key: :user_id, inverse_of: :ratings
end
