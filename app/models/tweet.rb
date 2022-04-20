class Tweet < ApplicationRecord
    has_many :comments
    has_many :reactions
    belongs_to :user
end
