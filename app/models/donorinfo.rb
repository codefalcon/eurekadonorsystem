class Donorinfo < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  include ApplicationHelper
  
  def Type
	donor_type = DonorType.DonorTypes().select { |key, value| value == self.donor_type }
	
	if donor_type.nil? 
		return nil 
	else 
		return donor_type[0][0] 
	end
  end


  def Status
	# @donor_villages = DonorVillage.find_all_by_user_id_and_status(self.user_id, Status::Active).where(["start_date between :s and :e or end_date between :s and :e", { s: self.start_date, e: self.end_date}])

	# total_amount_used = @donor_villages.inject(0) { |sum, d_v| sum + d_v.amount_for_village }

	if(self.amount_used == 0)
		return "Not Allocated"
	elsif(self.amount_donated <= self.amount_used)
		return "Fully Allocated"
	elsif (self.amount_donated > self.amount_used)
		return "Partially Allocated"
	end 
  end

  def villages
     Donorvillage.find_all_by_user_id_and_status(self.user_id, Status::Active)
  end 
  
end
