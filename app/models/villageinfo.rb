class Villageinfo < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :village, foreign_key: "village_id", class_name: "Village"
  validates :total_funding_required, :numericality => {:greater_than => 0.01}
  validates :local_contributions, :numericality => {:greater_than_or_equal_to => 0}
  belongs_to :partner, foreign_key: "partner_id", class_name: "Partner"

  def Status
	funding_status = FundingStatus.FundingStatuses().select { |key,value| value == self.funding_status }
	
	if funding_status.nil? 
	     return nil 
	else 
	     return funding_status[0][0] 
	end
  end


end 
