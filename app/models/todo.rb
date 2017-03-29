class Todo < ApplicationRecord

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 12 }

end
