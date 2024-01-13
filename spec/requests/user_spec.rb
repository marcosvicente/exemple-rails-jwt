require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /create" do
    let!(:user_attr) { attributes_for(:user) }
    it "should be create a new user" do
      post "/user/create",
        params: {user: user_attr}
        expect(response).to have_http_status(:success)

        expect(response_body["user"]["email"]).to eq(user_attr[:email])
        expect(response_body["user"]["first_name"]).to eq(user_attr[:first_name])
        expect(response_body["user"]["last_name"]).to eq(user_attr[:last_name])
        expect(response_body["user"]["username"]).to eq(user_attr[:username])
    end
  end
end
