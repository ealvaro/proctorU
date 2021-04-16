class College < ApplicationRecord
  has_many :exams, dependent: :delete_all
  has_many :users, dependent: :delete_all
  validates :name, presence: true

  def has_exam?(exam_id)
    byebug
    exams.pluck(:id).include?(exam_id)
  end
end
