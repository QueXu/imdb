require 'rails_helper'

RSpec.describe Movie, type: :model do
  context '#average_rating' do
    let!(:user_1) { User.create(email: 'test1@mail.com', password: 'password') }
    let!(:user_2) { User.create(email: 'test2@mail.com', password: 'password') }

    let!(:movie) { Movie.create(title: 'Test') }

    let!(:rating_1) { Rating.create(rate: 3, user: user_1, movie: movie) }
    let!(:rating_2) { Rating.create(rate: 5, user: user_2, movie: movie) }

    it 'should give average' do
      expect(movie.average_rating).to eq 4
    end
  end
end
