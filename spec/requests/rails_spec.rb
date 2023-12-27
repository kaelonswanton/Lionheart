require 'rails_helper'

RSpec.describe "Rails", type: :request do
  describe "GET /g" do
    it "returns http success" do
      get "/rails/g"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /controller" do
    it "returns http success" do
      get "/rails/controller"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /Admin::BaseController" do
    it "returns http success" do
      get "/rails/Admin::BaseController"
      expect(response).to have_http_status(:success)
    end
  end

end
