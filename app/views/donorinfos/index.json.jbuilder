json.array!(@donorinfos) do |donorinfo|
  json.extract! donorinfo, :user_id, :type, :amount_donated, :amount_used, :start_date, :end_date, :status
  json.url donorinfo_url(donorinfo, format: :json)
end
