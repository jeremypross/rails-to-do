class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

end

# dependent destroy will clear all task records associated with that owner

# validates - preserves data integrity
# fields that are: unique, not null, etc
