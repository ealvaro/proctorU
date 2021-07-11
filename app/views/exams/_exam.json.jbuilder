json.exam_id exam.id
json.title exam.title
unless exam.exam_windows.count.zero?
  exam.exam_windows.each do |exam_window|
    json.exam_times do
      json.partial! 'exam_windows/exam_window', locals: { exam_window: exam_window }
    end
  end
else
  json.exam_times []
end
