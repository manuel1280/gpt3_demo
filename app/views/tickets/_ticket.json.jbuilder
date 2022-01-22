json.extract! ticket, :id, :body, :category, :user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
