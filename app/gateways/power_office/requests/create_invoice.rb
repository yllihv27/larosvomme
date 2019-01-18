module PowerOffice
  module Requests
    class CreateInvoice < Base

      RESOURCE_NAME = 'OutgoingInvoice'.freeze

      delegate :sub_total, to: :order
      delegate :id, :created_at, to: :order, prefix: true

      private

      def request_params
        {

          totalAmount:          sub_total,
          orderNo:              order_id,
          orderDate:            order_created_at,
          outgoingInvoiceLines: order_course_names,
          netAmount:            sub_total,
        }
      end

      def order_course_names
        order.items.map(&:course).map(&:name)
      end
    end
  end
end
