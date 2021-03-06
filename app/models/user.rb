class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :encrypted_password, presence: true
  mount_uploader :icon, ImageUploader
  has_many :menus, dependent: :destroy
  has_many :menu_histories, dependent: :destroy
end
