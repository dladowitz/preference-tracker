require 'rails_helper'

describe UsersController do
  before(:each) do
    @agent1 = create :user, is_agent: true
    @agent2 = create :user, is_agent: true
  end

  describe "GET new" do
    subject { get :new }
    before(:each) do
      subject
    end

    it "renders the new template" do
      expect(response).to render_template :new
    end

    it "creates a new user object" do
      expect(assigns(:user)).to be_a_new User
    end

    it "finds all the agents" do
      expect(assigns(:agents)).to eq User.agents.order(:first_name)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new user in the database" do
        expect{ post :create, user: {first_name: "Andre", last_name: "Giant", email: "Andre.Ampere@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf" } }.to change{ User.count }.by 1
      end

      it "create a new user as an agent" do
        post :create, user: {first_name: "Andre", last_name: "Giant", email: "Andre.Ampere@gmail.com", is_agent: true, password: "asdfasdf", password_confirmation: "asdfasdf"}
        expect(assigns(:user).is_agent).to be true
      end

      it "creates a new user as a buyer" do
        post :create, user: {first_name: "Andre", last_name: "Giant", email: "Andre.Ampere@gmail.com", agent_id: @agent1.id, password: "asdfasdf", password_confirmation: "asdfasdf"}
        expect(assigns(:user).is_agent).to be nil
      end

      it "creates a new user as a buyer with an agent" do
        post :create, user: {first_name: "Andre", last_name: "Giant", email: "Andre.Ampere@gmail.com", agent_id: @agent1.id, password: "asdfasdf", password_confirmation: "asdfasdf"}
        expect(assigns(:user).agent).to eq @agent1
      end
    end

    context "with INVALID params" do
      subject { post :create, user: {first_name: "Andre", last_name: "Giant", email: nil, password: "asdfasdf", password_confirmation: nil } }

      it "does not create a new user in the database" do
        expect{ subject }.not_to change{ User.count }
      end
    end
  end

  describe "GET show" do
    let(:user) { create :user }

    before do
      login_user user
      subject
    end

    context "with a logged in user" do
      context "when the user is found in the database" do
        subject { get :show, { id: user.id } }

        it "renders the correct template" do
          expect(response).to render_template :show
        end

        it "find the correct user" do
          expect(assigns(:user)).to eq user
        end
      end

      context "when the user is not found in the database" do
        subject { get :show, { id: "not a real id" } }

        it "redirects to the landing page " do
          expect(response).to redirect_to user_path(user)
        end

        it "does NOT find a user" do
          expect(assigns(:user)).to be_nil
        end
      end
    end
  end
end
