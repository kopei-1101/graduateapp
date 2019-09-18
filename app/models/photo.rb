class Photo < ApplicationRecord
    t.string :image, null: false
    t.references :post, foreign_key: true, null: false

    mount_uploader :image, ImageUploader
end
