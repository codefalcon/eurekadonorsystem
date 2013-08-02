json.array!(@villageinfos) do |villageinfo|
  json.extract! villageinfo, :village_id, :funding_status, :total_funding_required, :initial_cpi, :ngo_name, :start_date, :end_date, :status, :local_contributions
  json.url villageinfo_url(villageinfo, format: :json)
end
