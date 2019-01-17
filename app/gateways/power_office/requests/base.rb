module PowerOffice
  module Requests
    class Base

      attr_reader :order

      def self.from(order)
        new(order)
      end

      def initialize(order)
        @order = order
      end

      def submit
        response.success?
      end

      private

      def response
        @response ||= PowerOffice::ApiClient.post(self.class::RESOURCE_NAME, request_body)
      end

      def request_body
        request_params.to_json
      end

      def request_params
        raise NotImplementedError
      end
    end
  end
end
