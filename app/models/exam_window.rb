class ExamWindow < ApplicationRecord
  belongs_to :exam

  def within_time_slot(start)
    byebug
    start.between?(start_time, end_time)
  end
end
