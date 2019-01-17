module PowerOffice
  module AuthenticationClient

    AUTHENTICATION_ENDPOINT = 'https://godemo.poweroffice.net'.freeze
    AUTH_TOKEN_ENDPOINT     = "#{AUTHENTICATION_ENDPOINT}/oAuth/token".freeze

    #Move those credentials out of the codebase and put them somewhere secure
    TEST_CLIENT_ID     = 'baca5a33-586c-4ca1-b35a-a94315072189'.freeze
    TEST_CLIENT_SECRET = 'f144ea7c-1db7-484f-847c-429f197f26b8'.freeze

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
