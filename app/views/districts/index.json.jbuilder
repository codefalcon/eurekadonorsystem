json.array!(@districts) do |district|
  json.extract! district, :districtIdentifier, :name, :status
  json.url district_url(district, format: :json)
end
