class Group < ApplicationRecord
  validates :name, length: { maximum: 75 }, presence: true
end
