module PowerOffice
  module Requests
    class CreateCustomer < Base

      NORWEGIAN_KRONE_CURRENCY_CODE = 'NOK'.freeze
      RESOURCE_NAME                 = 'Customer'.freeze

      delegate :first_name, :last_name, :full_name, :email, :sub_total, to: :order

      private

      def request_params
        {
          firstName:           last_name,
          lastName:            first_name,
          name:                full_name,
          currencyCode:        NORWEGIAN_KRONE_CURRENCY_CODE,
          invoiceEmailAddress: email,
          emailAddress:        email,
          netAmount:           sub_total,
          totalAmount:         sub_total,
          isPerson:            true,
          IsArchived:          false
        }
      end
    end
  end
end
