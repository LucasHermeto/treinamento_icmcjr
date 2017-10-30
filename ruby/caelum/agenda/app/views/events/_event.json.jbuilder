json.extract! event, :id, :name, :local, :start, :end, :created_at, :updated_at
json.url event_url(event, format: :json)
