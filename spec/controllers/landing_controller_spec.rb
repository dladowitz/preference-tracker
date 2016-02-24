require 'rails_helper'


describe LandingController do
  describe "GET landing" do
    subject { get :index }

    it "returns the landing template" do
      subject
      expect(response).to render_template :landing
    end
  end
end
