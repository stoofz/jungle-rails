require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do
  describe "GET /admin/categories" do
    it "returns http success" do
      get "/admin/categories/admin/categories"
      expect(response).to have_http_status(:success)
    end
  end

end
