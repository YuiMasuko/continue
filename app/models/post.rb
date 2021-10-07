class Post < ApplicationRecord
  validates :content, length: { maximum: 100 }
  validates :image, presence: true
  validates :event_on, presence: true
  validate :date_check

  def date_check
    return if event_on.blank?
    errors.add(:event_on, "未来の日付は登録できません") if event_on > Date.today
  end

  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

end
