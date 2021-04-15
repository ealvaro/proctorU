class College < ApplicationRecord
  has_many :exams, dependent: :delete_all
  has_many :users, dependent: :delete_all
  validates :name, presence: true
end
