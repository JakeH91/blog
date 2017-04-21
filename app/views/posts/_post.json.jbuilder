json.extract! post, :id, :title, :content, :author, :date_of_event, :location, :likes, :dislikes, :created_at, :updated_at
json.url post_url(post, format: :json)
