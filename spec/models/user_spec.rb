require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: 'test@test.com', password: 'password') }
  let!(:rating) { Rating.create(rate: 6, user: user, movie: Movie.create(title: 'Test')) }

  context '#ratings' do
    it 'user should have ratings' do
      expect(user.ratings).to eq [rating]
    end
  end
end
