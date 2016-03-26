class Publication < ActiveRecord::Base
  validates :name, :abstract, :keywords, presence: { :message => "data not present" }
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :students
end
