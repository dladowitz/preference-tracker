require 'rails_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_uniqueness_of :email }
  it { should have_secure_password }

  # it { should validate_length_of(:password).is_at_least(6) } Conflicting info which to use
  it { should ensure_length_of(:password).is_at_least(6) }

  it "has a valid factory" do
    user = create :user
    expect(user).to be_instance_of User
  end

  it "can be set as an agent" do
    user = create :user, is_agent: true
    expect(user.is_agent).to be true
  end

  it "can have clients" do
    agent = create :user, is_agent: true
    client = create :user, agent_id: agent.id
    expect(agent.clients).to include client
  end

  it "can have one agent" do
    agent = create :user, is_agent: true
    client = create :user, agent_id: agent.id
    expect(client.agent).to eq agent
  end
end
