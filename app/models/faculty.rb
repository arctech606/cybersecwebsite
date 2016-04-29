class Faculty < ActiveRecord::Base
  
  validates :name, :dept, :desc, :office, :phone_no, :email, presence: { :message => "data not present" }
  has_many :projects
  has_many :publications
  has_many :research_interests
  has_and_belongs_to_many :students
  has_secure_password
  validates :password, length: { minimum: 6 }
  attr_accessor :remember_token
  mount_uploader :picture, PictureUploader
  extend FriendlyId
  friendly_id :name
  validate  :picture_size

  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
  
  def Faculty.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Faculty.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Faculty.new_token
    update_attribute(:remember_digest, Faculty.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
