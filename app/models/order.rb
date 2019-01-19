class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'
  has_many :children
  has_one :grandparent
  has_one :contact_person
  has_many :participations
  accepts_nested_attributes_for :children, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['first_name'].blank? }

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_power_office_invoice
    PowerOffice::Requests::CreateInvoice.for(self).submit
  end

  def power_office_customer_id
    @power_office_customer_id ||= Member.where(id: member_id).pluck(:poweroffice_external_id)
  end
end
