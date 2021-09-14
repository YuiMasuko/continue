class Post < ApplicationRecord
  validates :content, length: { maximum: 100 }
  validates :image, presence: true
  validates :event_on, presence: true

  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader
end
