require 'rails_helper'

describe 'Users API', type: :request do
  include APIHelpers

  describe "when list users: GET /api/users" do
    it "should return json of users without password field" do
      # Act
      api_get "/users"
      # Assert
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(User.all.without_password.to_json)
    end
  end

  describe "when show user: GET /api/users/:id" do
    before(:each) do
      # Arrange
      @user = User.create name: 'Teste', email: 'teste@gmail.com', password: '123456'
    end
    it "should return a single user in json" do
      # Act
      api_get "/users/#{@user.id}"
      # Assert
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(User.find(@user.id).to_json)
    end
    it "should return a bad request 400 if user not found" do
      # Arrange
      id = @user.id
      @user.destroy
      # Act
      api_get "/users/#{id}"
      # Assert
      expect(response).to have_http_status(:bad_request)
      expect(response.body).to include({message: 'record_not_found'}.to_json)
    end
  end

  describe "when insert user: POST /api/users" do
    before(:each) do
      @user = {
        name: 'Fulano',
        email: 'fulano@gmail.com',
        password: '123456'
      }
    end

    it "should have status 200 and the user in json format with id" do
      # Arrange
      api_post '/users', {user: @user}
      # Act
      @user = User.last
      # Assert
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(@user.to_json)
    end
  end

  describe "when update user: PUT/PATCH /api/users" do
    before(:each) do
      @user = User.first
    end

    it "should have status 200 and return the updated user" do
      # Arrange
      @user.name = 'Changed user'
      # Act
      api_put "/users/#{@user.id}", {user: @user.attributes}
      # Assert
      expect(response).to have_http_status(:ok)
      expect(response.body).to include @user.name
      expect(response.body).to include @user.id.to_s
    end

    it "should have status 400 and return erros when user is invalid" do
      # Arrange
      @user.name = ''
      messages = {
        message: 'not_saved',
        errors: {
          name: ['not_blank']
        }
      }
      # Act
      api_put "/users/#{@user.id}", {user: @user.attributes}
      # Assert
      expect(response).to have_http_status(:bad_request)
      expect(response.body).to include(messages.to_json)
    end
  end

  describe "when remove user: DELETE /api/users/:id" do
    it "should remove user from database and return it" do
      # Arrange
      @user = User.first
      # Act
      api_delete "/users/#{@user.id}"
      # Assert
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(@user.to_json)
    end
  end
end
