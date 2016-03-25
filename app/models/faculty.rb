class Faculty < ActiveRecord::Base
  has_many :projects
  has_many :publications
  has_many :research_interests
  has_and_belongs_to_many :students
  validates :name,presence:{ message:"Name field cannot be empty"}
end
