class Story < ApplicationRecord
  validates :summary, :description, :completion_time, :type, :cost, presence: true
end
