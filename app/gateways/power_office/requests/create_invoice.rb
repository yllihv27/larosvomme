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
          outgoingInvoiceLines: included_courses,
          netAmount:            sub_total,
          customerCode:         power_office_customer_id
        }
      end

      def included_courses
        order.items.map(&:course).map do |course|
          {
            description: course.course_name,
            quantity:    1,
            unitPrice:   course.price
          }
        end
      end
    end
  end
end
