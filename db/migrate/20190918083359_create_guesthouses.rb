class CreateGuesthouses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesthouses do |t|
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :appeal
      t.timestamps
    end
  end
end
