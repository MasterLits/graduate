json.extract! task, :id, :body, :cost, :date, :location, :created_at, :updated_at
json.url task_url(task, format: :json)