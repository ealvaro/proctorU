class ExamWindow < ApplicationRecord
  belongs_to :exam

  def within_time_slot(start)
    start.between?(start_time, end_time)
  end
end
