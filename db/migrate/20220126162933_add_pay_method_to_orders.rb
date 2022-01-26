class AddPayMethodToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :pay_method, :string
  end
end
