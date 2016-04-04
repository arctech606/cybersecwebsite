class Faculty < ActiveRecord::Base
  validates :name, :dept, :desc, :office, :phone_no, :email, presence: { :message => "data not present" }
  has_many :projects
  has_many :publications
  has_many :research_interests
  has_and_belongs_to_many :students
  has_secure_password
  validates :password, length: { minimum: 6 }
end
