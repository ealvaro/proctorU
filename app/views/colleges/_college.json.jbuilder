json.college_id college.id
json.college_name college.name
unless college.exams.count.zero?
  college.exams.each do |exam|
    json.exam do
      json.partial! 'exams/exam', locals: { exam: exam }
    end
  end
else
  json.exam []
end
