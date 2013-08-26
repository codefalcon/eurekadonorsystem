json.array!(@partners) do |partner|
  json.extract! partner, :name, :partner_code, :status
  json.url partner_url(partner, format: :json)
end
