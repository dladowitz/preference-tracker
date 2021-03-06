class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @page_name = "Find someone new to follow"
    @users = User.all
  end

  def new
    if params[:agent_id]
      @agent = User.find params[:agent_id]
      @user = @agent.clients.new
    else
      @user = User.new
      @agents = User.agents.order(:first_name)
    end

    # render layout: "guest_pages/guest_layout"
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "You did it. You successfully signed up. Hi-five!"

      #TODO Mailer should be sent asyncronously. Need to change so not to hold up the controller
      # UserMailer.signup_email(@user).deliver

      session[:id] = @user.id
      redirect_to user_showing_trackings_path(@user)
    else
      @agent = User.find_by_id user_params[:agent_id]
      @agents = User.agents.order(:first_name)
      render :new #, layout: "guest_pages/guest_layout"
    end
  end

  def show
    @page_name = "Dashboard"

    if @user
      render :show
    else
      redirect_to root_path
    end
  end

  def edit
    @page_name = @user.first_name.capitalize
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Updated account"
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :is_agent, :agent_id, :password, :password_confirmation, :admin)
  end
end
