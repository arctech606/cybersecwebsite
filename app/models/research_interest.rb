class ResearchInterest < ActiveRecord::Base
  validates :name, presence: { :message => "data not present" }
  belongs_to :faculty
  belongs_to :student
end
