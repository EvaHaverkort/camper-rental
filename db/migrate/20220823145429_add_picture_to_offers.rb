class AddPictureToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :picture_url, :string
  end
end
