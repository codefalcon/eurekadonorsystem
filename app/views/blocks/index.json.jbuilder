json.array!(@blocks) do |block|
  json.extract! block, :name, :status, :district_id
  json.url block_url(block, format: :json)
end
