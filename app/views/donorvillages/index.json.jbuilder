json.array!(@donorvillages) do |donorvillage|
  json.extract! donorvillage, :village_id, :user_id, :start_date, :end_date, :amount_for_village, :status
  json.url donorvillage_url(donorvillage, format: :json)
end
