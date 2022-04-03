require 'rails_helper'

RSpec.describe "Distributions", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/distributions/create"
      expect(response).to have_http_status(:success)
    end
  end

end
