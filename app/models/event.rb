class Event < ActiveRecord::Base
validates :name, :date, :desc, :venue, presence: { :message => "data not present" }
end
