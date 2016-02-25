require 'rails_helper'

describe ShowingTrackingsController do
  describe "index" do
    before { @user = create :user }
    subject { get :index, user_id: @user.id }

    it "renders the index template correctly" do
      subject
      expect(response).to render_template :index
    end

    it "finds all the showing_trackings for a user" do
      showing_tracking = create :showing_tracking, user_id: @user.id

      subject
      expect(assigns(:showing_trackings)).to include [showing_tracking]
    end
  end
end
