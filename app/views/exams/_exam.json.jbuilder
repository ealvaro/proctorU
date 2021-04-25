json.exam_id exam.id
json.title exam.title
json.exam_times exam.exam_windows.each do |exam_window|
  json.partial! 'exam_windows/exam_window', locals: { exam_window: exam_window }
end

