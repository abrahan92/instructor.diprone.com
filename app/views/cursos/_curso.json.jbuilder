json.extract! curso, :id, :titulo, :subtitulo, :idioma, :categoria, :subcategoria, :nivel, :status, :resumen, :portada_uid, :portada_name, :created_at, :updated_at
json.url curso_url(curso, format: :json)