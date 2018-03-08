json.extract! mensaje, :id, :mensaje, :status, :created_at, :updated_at
json.url mensaje_url(mensaje, format: :json)