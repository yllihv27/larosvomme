module PowerOffice
  module Requests
    class CreateInvoice < Base

      RESOURCE_NAME = 'OutgoingInvoice'.freeze

      delegate :sub_total, to: :order
      delegate :id, :created_at, to: :order, prefix: true

      private

      def request_params
        {
          totalAmount: sub_total,
          orderNo:     order_id,
          orderDate:   order_created_at
        }
      end
    end
  end
end
