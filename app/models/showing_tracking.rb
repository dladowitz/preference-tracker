# == Schema Information
#
# Table name: salesforce.showing_tracking__c
#
#  _hc_lastop                    :string(32)
#  name                          :string(80)
#  showing_of_bathrooms__c       :float
#  showing_price__c              :float
#  createddate                   :datetime
#  showing_design_personality__c :float
#  showing_exterior__c           :float
#  showing_city__c               :string(100)
#  isdeleted                     :boolean
#  systemmodstamp                :datetime
#  showing_of_bedrooms__c        :float
#  _hc_err                       :text
#  sfid                          :string(18)
#  id                            :integer          not null, primary key
#  showing_street_address__c     :string(200)
#  showing_general_condition__c  :float
#  lastactivitydate              :date
#  showing_kitchen__c            :float
#  showing_neighborhood__c       :float
#  showing_land_scaping__c       :float
#  showing_square_footage__c     :string(100)
#  lastreferenceddate            :datetime
#  contact_name__c               :string(18)
#  showing_master_bedroom__c     :float
#  showing_commute__c            :float
#  showing_home_layout__c        :float
#  lastmodifiedbyid              :string(18)
#  ownerid                       :string(18)
#  createdbyid                   :string(18)
#  showing_local_schools__c      :float
#  showing_notes__c              :text
#  contact_email__c              :string(18)
#  lastmodifieddate              :datetime
#  lastvieweddate                :datetime
#

class ShowingTracking < ActiveRecord::Base
  self.table_name = 'salesforce.showing_tracking__c'

  belongs_to :contact, primary_key: "sfid", foreign_key: "contact_name__c"
  # Note that since salesforece isn't connected in development this relationship doesn't work automatically. Need to add 'sfid' to the contact in dev.
end
