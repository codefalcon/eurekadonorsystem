json.array!(@blockusers) do |blockuser|
  json.extract! blockuser, :block_id, :user_id, :role, :start_date, :end_date, :status
  json.url blockuser_url(blockuser, format: :json)
end
