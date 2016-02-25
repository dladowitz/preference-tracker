require 'rails_helper'

describe ShowingTrackingsController do
  before { @user = create :user }

  describe "index" do
    subject { get :index, user_id: @user.id }

    it "renders the index template correctly" do
      subject
      expect(response).to render_template :index
    end

    it "finds the correct user" do
      subject
      expect(assigns(:user).first_name).to eq @user.first_name
    end

    it "finds all the showing_trackings for a user" do
      showing_tracking = create :showing_tracking, user_id: @user.id

      subject
      expect(assigns(:showing_trackings)).to include showing_tracking
    end
  end

  describe "new" do
    subject { get :new, user_id: @user.id }

    it "renders the new template" do
      subject
      expect(response).to render_template :new
    end

    it "finds the correct user" do
      subject
      expect(assigns(:user).first_name).to eq @user.first_name
    end
  end

  describe "create" do
    subject { post :create, user_id: @user.id, showing_tracking: {street_address: "855 Front St", city: "San Francisco", price: 800000, bedrooms: 3, bathrooms: 2.5, kitchen: 5, exterior: 2, notes: "This place is the bestest"}}

    it "redirect_to the index template" do
      subject
      expect(response).to redirect_to user_showing_trackings_path(@user)
    end

    it "creates a new showing tracking in the database" do
      expect{ subject }.to change{ ShowingTracking.count}.by 1
    end
  end
end
