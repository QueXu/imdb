json.extract! movie, :id, :title, :description, :category, :poster, :created_at, :updated_at
json.url movie_url(movie, format: :json)
json.poster url_for(movie.poster)
