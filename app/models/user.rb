class User < ApplicationRecord
#before change is  user to save something in database before save the whole code
before_save { self.email = email.downcase }


has_many :articles

validates :username ,presence: true,   
                     uniqueness: { case_sensitive: false }, 
                     length: {minimum: 3, maximum: 25}

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i                    
validates :email, presence: true,
                  uniqueness: { case_sensitive: false },
                  length: { maximum: 105 },
                  format: { with: VALID_EMAIL_REGEX } 


 has_secure_password
end