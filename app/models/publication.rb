class Publication < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :student
end
