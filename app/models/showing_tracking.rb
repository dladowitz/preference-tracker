# == Schema Information
#
# Table name: showing_trackings
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  name               :string
#  street_address     :string
#  city               :string
#  price              :integer
#  bathrooms          :float
#  bedrooms           :integer
#  design_personality :integer
#  exterior           :integer
#  general_condition  :integer
#  kitchen            :integer
#  neighborhood       :integer
#  landscaping        :integer
#  square_footage     :integer
#  master_bedroom     :integer
#  commute            :integer
#  home_layout        :integer
#  local_schools      :integer
#  notes              :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ShowingTracking < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
end
