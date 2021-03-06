class Group < ApplicationRecord
  validates :name, length: { maximum: 75 }, presence: true

  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :posts, dependent: :destroy

  mount_uploader :image, ImageUploader

  def invite_member(user)
    assigns.create(user: user)
  end
end
