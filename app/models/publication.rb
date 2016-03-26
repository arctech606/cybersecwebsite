class Publication < ActiveRecord::Base
  validates :faculty, :student, :name, :abstract, :keywords, presence: { :message => "data not present" }
  belongs_to :faculty
  belongs_to :student
end
