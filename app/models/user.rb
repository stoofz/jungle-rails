class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    email_lowercase = email.downcase

    user = User.find_by_email(email_lowercase)
    if user.authenticate(password)
      user
    else
      nil
    end
  end

end




