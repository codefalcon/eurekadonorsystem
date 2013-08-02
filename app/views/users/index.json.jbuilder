json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :email_address, :phone_number, :gender, :user_id, :login, :password_digest, :role, :status
  json.url user_url(user, format: :json)
end
