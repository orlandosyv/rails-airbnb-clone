class AddReviewedToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :reviewed, :boolean
  end
end
