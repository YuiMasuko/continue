class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  VALID_SPECIFICATION_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,10}+\z/i

  validates :name, presence: true, length: { maximum: 20 }
  validates :specification, presence: true, length: { in: 6..10 }, format: { with: VALID_SPECIFICATION_REGEX, message: "は半角6~10文字で英数字それぞれ１文字以上含む必要があります"}
  validates :birthday, presence: true

  has_many :assigns, dependent: :destroy
  has_many :groups, through: :assigns
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :icon, IconUploader
end
