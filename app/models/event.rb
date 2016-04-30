class Event < ActiveRecord::Base
validates :name, :date, :desc, :venue, presence: { :message => "data not present" }
extend FriendlyId
friendly_id :name

def self.search(search)
    if search
     self. where(['name ILIKE ? OR venue ILIKE ?', "%#{search}%", "%#{search}%"])
      
    else
      self.all
    end
end

end
