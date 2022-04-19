class Reaction < ApplicationRecord
    belongs_to :user
    belongs_to :tweet
    enum status: [:like, :dislike, :not_set]

end
