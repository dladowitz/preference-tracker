class ShowingTrackingsController < ApplicationController
  before_filter :set_user

  def index
    @showing_trackings = @user.showing_trackings
  end

  def new
    @showing_tracking = @user.showing_trackings.new
  end


  def create
    @showing_tracking = @user.showing_trackings.new showing_tracking_params

    if @showing_tracking.save
      redirect_to user_showing_trackings_path(@user)
    else
      render :new
    end
  end

  private

  def showing_tracking_params
    params.require(:showing_tracking).permit(:street_address, :city, :price, :square_footage,
                                             :bedrooms, :bathrooms, :general_condition, :seighborhood,
                                             :commute, :exterior, :kitchen, :design_personality,
                                             :home_layout, :landscaping, :local_schools, :master_bedroom,
                                             :notes)
  end

  def set_user
    @user = User.find params[:user_id]
  end
end
