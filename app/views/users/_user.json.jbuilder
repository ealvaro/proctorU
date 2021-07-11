json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.phone_number user.phone_number
if user.college
  json.college do
    json.partial! 'colleges/college', locals: { college: user.college }
  end
end
