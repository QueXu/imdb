# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :rate, null: false, default: 0
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
