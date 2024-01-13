module Request
  module AuthHelpers
    # usado para login em controllers
    def login_as(user)
      token = JsonWebToken.jwt_encode(user_id: user.id)
      {
        'Authorization' => "Bearer #{token}", 'Accept' => 'application/json',
        'HTTP_USER_AGENT' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
         Chrome/106.0.0.0 Safari/537.3'
      }
    end

    def response_body(symbolize_keys: false)
      json = JSON.parse(response.body)
      symbolize_keys ? json.deep_symbolize_keys : json
    end
  end
end
