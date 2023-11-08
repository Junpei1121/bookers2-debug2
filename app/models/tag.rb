class Tag < ApplicationRecord
  has_many :book_tags, dependent: :destroy,foreign_key: 'tag_id'
  has_many :books, through: :book_tags

  validates :name, presence:true, length:{maximum:50}
end
