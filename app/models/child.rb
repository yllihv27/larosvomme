class Child < ApplicationRecord
	belongs_to :member
	has_many :orders
end
