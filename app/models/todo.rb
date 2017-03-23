class Todo < ApplicationRecord

  validates :name, length: { minimum: 6 }
  validates :description, length: { minimum: 6 }

end
