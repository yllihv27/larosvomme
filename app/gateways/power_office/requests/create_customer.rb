module PowerOffice
  module Requests
    class CreateCustomer < Base

      NORWEGIAN_KRONE_CURRENCY_CODE = 'NOK'.freeze
      RESOURCE_NAME                 = 'Customer'.freeze

      attr_reader :member

      delegate :first_name, :last_name, :full_name, :email, to: :member

      def initialize(member)
        @member = member
      end

      def submit
        fetch_external_id if response.success?
      end

      private

      def request_params
        {
          firstName:           last_name,
          lastName:            first_name,
          name:                full_name,
          currencyCode:        NORWEGIAN_KRONE_CURRENCY_CODE,
          invoiceEmailAddress: email,
          emailAddress:        email,
          isPerson:            true,
          IsArchived:          false
        }
      end

      def fetch_external_id
        member.update_attribute(:poweroffice_external_id, external_id)
      end

      def external_id
        parsed_response_body.dig(:data, :code)
      end
    end
  end
end
