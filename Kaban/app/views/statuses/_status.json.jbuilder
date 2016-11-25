json.extract! status, :id, :body, :created_at, :updated_at
json.url status_url(status, format: :json)