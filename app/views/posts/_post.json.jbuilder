json.extract! post, :id, :event_on, :content, :image, :user_id, :group_id, :created_at, :updated_at
json.url post_url(post, format: :json)
