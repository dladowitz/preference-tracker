class ShowingTrackingsController < ApplicationController
  before_filter :set_user

  def index
    @showing_trackings = @user.showing_trackings.reverse
  end

  def new
    @showing_tracking = @user.showing_trackings.new
  end


  def create
    @showing_tracking = @user.showing_trackings.new showing_tracking_params
    normalize_price

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

  # TODO build tests for this
  def normalize_price
    normalized_price = showing_tracking_params[:price]

    if showing_tracking_params[:price].include? "$"
      normalized_price = showing_tracking_params[:price].gsub("$", "")
    end

    if normalized_price.include? ","
      normalized_price = normalized_price.gsub(",", "")
    end

    @showing_tracking.price = normalized_price
  end
end
