class AddImageToGuesthouses < ActiveRecord::Migration[5.2]
  def change
    add_column :guesthouses, :image, :string
  end
end
