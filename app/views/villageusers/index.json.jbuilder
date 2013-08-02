json.array!(@villageusers) do |villageuser|
  json.extract! villageuser, :village_id, :user_id, :role, :start_date, :end_date, :status
  json.url villageuser_url(villageuser, format: :json)
end
