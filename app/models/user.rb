class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false}
  validates :name, presence: true
  # validates :password_digest, presence: true
  validates :password, presence: true,
                        length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    @user = User.where('lower(email) = ?', email.downcase).first
    if @user && @user.authenticate(password)
      return @user
    else
      nil
    end
  end

end
