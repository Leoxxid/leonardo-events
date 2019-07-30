class Issue < ApplicationRecord
  has_many :events
  validates_presence_of :number
  validates_presence_of :title
end
