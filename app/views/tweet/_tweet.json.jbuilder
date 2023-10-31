json.extract! tweet, :id, :message, :tdate, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
