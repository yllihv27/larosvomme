module PowerOffice
  module Requests
    class CreateCustomer < Base

      NORWEGIAN_KRONE_CURRENCY_CODE = 'NOK'.freeze
      RESOURCE_NAME                 = 'Customer'.freeze

      delegate :first_name, :last_name, :email, :full_name, to: :order

      private

      def request_params
        {
          firstName:           first_name,
          lastName:            last_name,
          name:                full_name,
          currencyCode:        NORWEGIAN_KRONE_CURRENCY_CODE,
          invoiceEmailAddress: email,
          emailAddress:        email
        }
      end
    end
  end
end
