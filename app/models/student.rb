class Student < ActiveRecord::Base
 validates :name, :dept, :desc , presence: { :message => "data not present" }
  has_many :projects
  has_many :publications
  has_many :research_interests
  has_and_belongs_to_many :faculties
  has_secure_password
  validates :password, length: { minimum: 6 }
  attr_accessor :remember_token
  extend FriendlyId
  friendly_id :name
  def Student.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Student.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Student.new_token
    update_attribute(:remember_digest, Student.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def self.search(search)
    if search
     self. where(['name ILIKE ? OR dept ILIKE ?', "%#{search}%", "%#{search}%"])
      
    else
      self.all
    end
  end
  
end

