module PowerOffice
  module AuthenticationClient

    AUTHENTICATION_ENDPOINT = 'https://godemo.poweroffice.net'.freeze
    AUTH_TOKEN_ENDPOINT     = "#{AUTHENTICATION_ENDPOINT}/oAuth/token".freeze

    #Move those credentials out of the codebase and put them somewhere secure
    TEST_CLIENT_ID     = '2bdf3b52-d879-418a-953e-2212a54de6e8'.freeze
    TEST_CLIENT_SECRET = '0bbb718b-eeae-4185-9a27-6a0984a6a3d3'.freeze

    def get_token
      OAuth2::Client.new(client_id, client_secret, site: AUTHENTICATION_ENDPOINT)
        .client_credentials
        .get_token
        .token
    end

    private

    def client_id
      # TODO: # add logic for live / test environment
      TEST_CLIENT_ID
    end

    def client_secret
      # TODO: # add logic for live / test environment
      TEST_CLIENT_SECRET
    end

    module_function :get_token, :client_id, :client_secret
  end
end
