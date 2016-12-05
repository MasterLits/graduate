json.extract! user, :id, :first_name, :last_name, :email, :login, :password, :photo, :tel, :role, :inn, :passport, :description, :created_at, :updated_at
json.url user_url(user, format: :json)