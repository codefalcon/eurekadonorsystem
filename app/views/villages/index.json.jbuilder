json.array!(@villages) do |village|
  json.extract! village, :name, :status, :block_id
  json.url village_url(village, format: :json)
end
