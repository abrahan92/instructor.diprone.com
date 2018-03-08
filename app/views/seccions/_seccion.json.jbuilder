json.extract! seccion, :id, :titulo, :descripcion, :created_at, :updated_at
json.url seccion_url(seccion, format: :json)