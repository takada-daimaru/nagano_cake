require 'rails_helper'

RSpec.describe "Admins::Types", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/types/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admins/types/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/types/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/types/update"
      expect(response).to have_http_status(:success)
    end
  end

end
