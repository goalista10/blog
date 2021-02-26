class Blogger < ApplicationRecord
    validates :name,:level, presence: true
    has_many :comments
end
