class User < ActiveRecord::Base
  
  validates :username, uniqueness: true, length: { maximum: 50 }
  validates :email, uniqueness: true, length: { maximum: 50 }
  
  #before_save :encrypt_new_password


  def self.authenticate(email, encrypted_password)
    user = find_by_email(email)
    return user if user && user.authenticated?(encrypted_password)
  end

  #def authenticated?(encrypted_password)
   # self.hashed_password == encrypt(encrypted_password)
  #end




  protected

  #def encrypt_new_password
   # return if encrypted_password.blank?
    #self.hashed_password = encrypt(encrypted_password)
  #end

  #def password_required?
    #hashed_password.blank? || encrypted_password.present?
  #end

  #def encrypt(string)
   # Digest::SHA1.hexdigest(string)
  #end
end
