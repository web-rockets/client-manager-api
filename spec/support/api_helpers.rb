module APIHelpers
  def api_get(url)
    get "/api#{url}", nil, @headers
  end

  def api_post(url, payload)
    post "/api#{url}", payload, @headers
  end

  def api_put(url, payload)
    put "/api#{url}", payload, @headers
  end

  def api_delete(url)
    delete "/api#{url}", nil, @headers
  end

  def create_token
    @auth_user = User.first if @auth_user.nil?
    # Knock::AuthToken.new(payload: { sub: @auth_user.id }).token
    post '/api/user_token', {auth: {email: @auth_user.email, password: '123456'}}
    JSON(response.body)['jwt']
  end

  def authenticate
    @headers = {
      'Authorization' => "Bearer #{create_token}"
    }
  end
end
