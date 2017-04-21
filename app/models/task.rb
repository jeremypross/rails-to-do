class Task < ApplicationRecord
  belongs_to :user

  validates :task, presence: true
  validates :user_id, presence: true
  
end
