class Exam < ApplicationRecord
  has_one :exam_window
  belongs_to :college
end
