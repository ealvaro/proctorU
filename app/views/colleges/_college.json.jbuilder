json.college_id college.id
json.college_name college.name
json.college_exams college.exams.each do |exam|
  json.partial! 'exams/exam', locals: { exam: exam }
end
