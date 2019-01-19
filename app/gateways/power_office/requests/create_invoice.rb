module PowerOffice
  module Requests
    class CreateInvoice < Base

      RESOURCE_NAME = 'OutgoingInvoice'.freeze

      attr_reader :order

      delegate :sub_total, :power_office_customer_id, to: :order
      delegate :id, :created_at, to: :order, prefix: true

      def initialize(order)
        @order = order
      end

      def submit
        response.success?
      end

      private

      def request_params
        {
          totalAmount:          sub_total,
          orderNo:              order_id,
          orderDate:            order_created_at,
          outgoingInvoiceLines: order_course_names,
          netAmount:            sub_total,
          customerCode:         power_office_customer_id
        }
      end

      def order_course_names
        order.items.map(&:course).map(&:name).compact
      end
    end
  end
end
