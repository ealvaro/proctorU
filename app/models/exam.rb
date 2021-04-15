class Exam < ApplicationRecord
  has_many :exam_windows, dependent: :destroy
  belongs_to :college
end
