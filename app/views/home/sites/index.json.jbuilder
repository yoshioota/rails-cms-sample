json.array!(@sites) do |site|
  json.extract! site, :id, :user_id, :title, :aasm_state
  json.url site_url(site, format: :json)
end
