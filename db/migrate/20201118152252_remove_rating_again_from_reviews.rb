class RemoveRatingAgainFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :rating, :string
  end
end
