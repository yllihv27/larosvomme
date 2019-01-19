module PowerOffice
  module Requests
    class Base

      def self.for(entity)
        new(entity)
      end

      def submit
        raise NotImplementedError
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

      def parsed_response_body
        @parsed_response ||= JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
