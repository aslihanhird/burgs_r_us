class AddPriceToBurgers < ActiveRecord::Migration[7.0]
  def change
    add_column :burgers, :price, :float
  end
end
