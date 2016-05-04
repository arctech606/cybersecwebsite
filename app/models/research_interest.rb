class ResearchInterest < ActiveRecord::Base
  validates :name, presence: { :message => "data not present" }
  has_and_belongs_to_many :faculties ,:join_table => "faculties_research_interests"
  has_and_belongs_to_many :students,:join_table => "research_interests_students"
  extend FriendlyId
  friendly_id :name
end
