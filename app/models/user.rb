class User < ApplicationRecord
  belongs_to :college
  validates :first_name, :last_name, presence: true

  def self.find_by_first_and_last_name(first_name, last_name)
    self.find_by(first_name: first_name, last_name: last_name)
  end
end
