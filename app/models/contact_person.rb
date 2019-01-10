class ContactPerson < ApplicationRecord
	belongs_to :member
	has_many :orders
end
