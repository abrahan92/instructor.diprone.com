json.extract! pagina, :id, :nombre, :url, :created_at, :updated_at
json.url pagina_url(pagina, format: :json)