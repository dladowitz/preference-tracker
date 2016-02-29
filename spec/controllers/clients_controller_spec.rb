require 'rails_helper'

describe ClientsController do
  before(:each) do
    @agent = create :user, is_agent: true
    @client1 = create :user, agent_id: @agent.id
    @client2 = create :user, agent_id: @agent.id
  end

  describe "index" do
    subject { get :index, user_id: @agent.id }

    it "renders the index template" do
      subject
      expect(response).to render_template :index
    end

    it "finds the correct agent" do
      subject
      expect(assigns(:agent).to eq @agent
    end

    it "finds all the agent's clients" do
      subject 
      expect(assign(:clients)).to include [@client1, @client2]
    end
  end
end
