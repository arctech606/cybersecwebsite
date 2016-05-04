class Project < ActiveRecord::Base
  validates :name, :sponsor, :desc, presence: { :message => "data not present" }
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :students
  extend FriendlyId
  friendly_id :name
end
