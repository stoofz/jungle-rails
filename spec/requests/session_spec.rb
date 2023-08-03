require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /session" do
    it "returns http success" do
      get "/session/session"
      expect(response).to have_http_status(:success)
    end
  end

end
