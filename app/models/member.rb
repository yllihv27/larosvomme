class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_and_belongs_to_many :courses
  has_many :children
  has_many :grandparents
  mount_uploader :profile_pic, ProfilePicUploader
  accepts_nested_attributes_for :children, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['first_name'].blank? }
end
