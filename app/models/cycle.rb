class Cycle < ApplicationRecord
    belongs_to :user
    has_many :symptoms
end
