class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :brand
      t.float :price
      t.text :description
      t.date :availiblity_start_date
      t.date :availibility_end_date

      t.timestamps
    end
  end
end
