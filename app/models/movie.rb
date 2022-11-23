# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :poster, dependent: :destroy

  acts_as_taggable_on :categories

  has_many :rates

  CATEGORIES = %w[
    Action Drama Adventure Romance Western Crime History Biography Comedy
  ].freeze

  has_many :ratings, foreign_key: :movie_id, inverse_of: :movie, dependent: :destroy
end
