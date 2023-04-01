class Article < ApplicationRecord
    validates :title, presence: true
    validates :article_photo, presence: true
    validates :content, presence: true, length: {minimum: 10}
    validates :category, presence: true
    belongs_to :publisher
    has_one_attached :article_photo
    has_rich_text :content
end
