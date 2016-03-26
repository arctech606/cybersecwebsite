class Student < ActiveRecord::Base
 validates :name, :dept, :desc , presence: { :message => "data not present" }
  has_many :projects
  has_many :publications
  has_many :research_interests
  has_and_belongs_to_many :faculties
end
