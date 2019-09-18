class Post < ApplicationRecord
    t.string :caption
    t.references :user, foreign_key: true, null: false
end
