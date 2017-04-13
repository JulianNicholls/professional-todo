class Todo < ApplicationRecord
  belongs_to :user

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 12 }
  validates :user_id, presence: true
end
