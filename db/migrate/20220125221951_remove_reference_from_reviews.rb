class RemoveReferenceFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reviews, :order, null: false, foreign_key: true
  end
end
