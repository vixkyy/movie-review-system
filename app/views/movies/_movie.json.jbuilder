json.extract! movie, :id, :name, :release_date, :director, :actor, :created_at, :updated_at
json.url movie_url(movie, format: :json)
