class Member < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum gdpr: ['0', '1']
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_presence_of :gdpr
  has_and_belongs_to_many :courses
  has_many :children
  has_many :grandparents
  has_many :contact_people
  has_many :emails
  mount_uploader :profile_pic, ProfilePicUploader
  paginates_per 10
  accepts_nested_attributes_for :children, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['first_name'].blank? }

  after_create :submit_client_to_poweroffice

  def submit_client_to_poweroffice
    PowerOffice::Requests::CreateCustomer.for(self).submit
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
