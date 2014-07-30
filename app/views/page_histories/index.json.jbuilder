json.array!(@page_histories) do |page_history|
  json.extract! page_history, :id, :page_id, :title, :body_source, :body
  json.url page_history_url(page_history, format: :json)
end
