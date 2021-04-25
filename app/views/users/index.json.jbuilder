json.array! @users.each do |user|
  json.partial! 'user', locals: { user: user }
end
