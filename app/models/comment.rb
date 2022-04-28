class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :tweet
    validates :description, presence: true
end
