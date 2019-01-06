class Email < ApplicationRecord
	enum status: [:kladde, :sendt]
	belongs_to :coach
	belongs_to :course
	has_many :members
end
