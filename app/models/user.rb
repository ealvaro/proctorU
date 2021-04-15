class User < ApplicationRecord
  belongs_to :college
  validates :first_name, :last_name, presence: true
end
