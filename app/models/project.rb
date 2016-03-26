class Project < ActiveRecord::Base
  validates :name, :sponsor, :desc, presence: { :message => "data not present" }
  belongs_to :faculty
  belongs_to :student
end
