class Tweet < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    belongs_to :user
end
