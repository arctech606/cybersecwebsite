json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :desc, :venue
  json.url event_url(event, format: :json)
end
