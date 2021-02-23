class Blogger < ApplicationRecord
    validates :name,:level, presence: true
end
