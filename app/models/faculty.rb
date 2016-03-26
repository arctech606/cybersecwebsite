class Faculty < ActiveRecord::Base
  validates :name, :dept, :desc, :office, :phone_no, :email,:projects, :publications, :research_interests, :students, presence: { :message => "data not present" }
  has_many :projects
  has_many :publications
  has_many :research_interests
  has_and_belongs_to_many :students
  
end
