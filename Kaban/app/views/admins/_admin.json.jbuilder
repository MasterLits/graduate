json.extract! admin, :id, :login, :password, :role, :photo, :tel, :email, :created_at, :updated_at
json.url admin_url(admin, format: :json)