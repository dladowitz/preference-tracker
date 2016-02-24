# == Schema Information
#
# Table name: salesforce.contact
#
#  lastname                                :string(80)
#  name                                    :string(121)
#  email                                   :string(80)
#  createddate                             :datetime
#  firstname                               :string(40)
#  systemmodstamp                          :datetime
#  _hc_err                                 :text
#  _hc_lastop                              :string(32)
#  id                                      :integer          not null, primary key
#  isdeleted                               :boolean
#  sfid                                    :string(18)
#  favorite_feature_2__c                   :string(40)
#  deal_breaker_feature_3__c               :string(40)
#  deal_breaker_feature_2__c               :string(40)
#  favorite_feature_1__c                   :string(40)
#  how_soon_until_they_re_ready_to_sign__c :string(255)
#  phone                                   :string(40)
#  deal_breaker_feature_1__c               :string(40)
#  favorite_feature_3__c                   :string(40)
#  showing_tracking_url__c                 :string(255)
#

class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'

  has_secure_password
  validates :password, length: { minimum: 6 }, if: :password_digest_changed?


  has_many :showing_trackings, primary_key: "sfid", foreign_key: "contact_name__c"
end
