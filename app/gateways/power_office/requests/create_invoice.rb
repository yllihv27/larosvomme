module PowerOffice
  module Requests
    class CreateInvoice < Base

      RESOURCE_NAME = 'OutgoingInvoice'.freeze

      delegate :email, :sub_total, :full_name, to: :order
      delegate :id, :created_at, to: :order, prefix: true

      private

      def request_params
        {
          name:        full_name,
          netAmount:   sub_total,
          totalAmount: sub_total,
          customerEmail: email,
          orderNo:     order_id,
          orderDate:   order_created_at
        }
      end
    end
  end
end
