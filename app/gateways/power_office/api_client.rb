module PowerOffice
  module ApiClient

    TEST_API_ENDPOINT = 'https://api-demo.poweroffice.net/'.freeze

    def post(resource, request_body)
      connector.post "/#{resource}", request_body
    end

    private

    def connector
      @connector ||= Faraday.new(url: TEST_API_ENDPOINT) do |conn|
                       conn.adapter  Faraday.default_adapter
                       conn.headers['Content-Type']  = 'application/json'
                       conn.headers['Authorization'] = "Bearer #{auth_token}"
                     end
    end

    def auth_token
      PowerOffice::AuthenticationClient.get_token
    end

    def endpoint
      # TODO: # add logic for live / test environment
      TEST_API_ENDPOINT
    end

    module_function :post, :connector, :auth_token, :endpoint
  end
end
