class ChangePriceToOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :price, :float
    add_column :offers, :price, :integer
  end
end
