json.array!(@sites_members) do |sites_member|
  json.extract! sites_member, :id, :site_id, :user_id
  json.url sites_member_url(sites_member, format: :json)
end
