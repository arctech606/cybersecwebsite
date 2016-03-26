class Publication < ActiveRecord::Base
  def self.search(search)
    if search
      self.where("keywords like ?", "%#{search}%")
    else
      self.all
    end
  end
  belongs_to :faculty
  belongs_to :student
end
