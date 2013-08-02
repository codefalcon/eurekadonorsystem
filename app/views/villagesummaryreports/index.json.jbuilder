json.array!(@villagesummaryreports) do |villagesummaryreport|
  json.extract! villagesummaryreport, :village_id, :children_enrolled, :children_attended, :class_working_days, :current_cpi, :activities_html, :start_date, :end_date
  json.url villagesummaryreport_url(villagesummaryreport, format: :json)
end
