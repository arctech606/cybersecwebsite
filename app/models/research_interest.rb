class ResearchInterest < ActiveRecord::Base
  validates :name, presence: { :message => "data not present" }
  belongs_to :faculty
  belongs_to :student
  mount_uploader :picture, PictureUploader
  extend FriendlyId
  friendly_id :name
end
