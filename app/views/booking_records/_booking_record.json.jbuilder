json.extract! booking_record, :id, :name, :description, :created_at, :updated_at
json.url booking_record_url(booking_record, format: :json)
