class Story < ApplicationRecord
  validates :summary, :description, :completion_time, :type, :cost, presence: true

  belongs_to :user, :foreign_key =>  :user_id
end
