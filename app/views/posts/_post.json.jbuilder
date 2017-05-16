json.extract! post, :id, :title, :content, :user_id, :date_of_event, :location, :likes, :dislikes, :created_at, :updated_at
json.url post_url(post, format: :json)
