# frozen_string_literal: true

module RatingHelper
  def star_rating_class(index, user_rating)
    return 'star.svg' unless user_rating

    index < user_rating ? 'filled_star.svg' : 'star.svg'
  end

  def user_rating(movie)
    return if current_user.blank?

    rating = movie.ratings.find_by(user: current_user)&.rate
    rating.present? ? rating : 0
  end
end
