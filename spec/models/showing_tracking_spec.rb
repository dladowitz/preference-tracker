require 'rails_helper'

RSpec.describe ShowingTracking, :type => :model do
  it { should validate_presence_of :user_id }
  it { should belong_to :user }

  it "has a valid factory" do
    showing_tracking = create :showing_tracking
    expect(showing_tracking).to be_instance_of ShowingTracking

  end
end
