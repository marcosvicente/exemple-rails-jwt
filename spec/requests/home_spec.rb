require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    let!(:current_user) { create(:user) }

    it "returns http success" do
      get "/home/index",
        headers: login_as(current_user)
      
        expect(response).to have_http_status(:success)
        expect(response_body["user"]["email"]).to eq(user_attr[:email])
        expect(response_body["user"]["first_name"]).to eq(user_attr[:first_name])
        expect(response_body["user"]["last_name"]).to eq(user_attr[:last_name])
        expect(response_body["user"]["username"]).to eq(user_attr[:username])
    end
  end

end
