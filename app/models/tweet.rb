class Tweet < ApplicationRecord
    has_many :comments
    has_many :reactions, dependent: :destroy
    belongs_to :user
end
