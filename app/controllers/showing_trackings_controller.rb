class ShowingTrackingsController < ApplicationController
  def index
    @contact = Contact.find params[:contact_id]
    @showing_trackings = @contact.showing_trackings
  end

  def new
    @contact = Contact.find params[:contact_id]
    @showing_tracking = @contact.showing_trackings.new
  end


  def create
    @contact = Contact.find params[:contact_id]
    @showing_tracking = @contact.showing_trackings.new showing_tracking_params

    if @showing_tracking.save
      redirect_to contact_showing_trackings_path(@contact)
    else
      render :new
    end
  end

  private

  def showing_tracking_params
    params.require(:showing_tracking).permit(:showing_street_address__c, :showing_city__c, :showing_price__c, :showing_square_footage__c,
                                             :showing_of_bedrooms__c, :showing_of_bathrooms__c, :showing_general_condition__c, :showing_neighborhood__c,
                                             :showing_commute__c, :showing_exterior__c, :showing_kitchen__c, :showing_design_personality__c,
                                             :showing_home_layout__c, :showing_land_scaping__c, :showing_local_schools__c, :showing_master_bedroom__c,
                                             :showing_notes__c)
  end
end
