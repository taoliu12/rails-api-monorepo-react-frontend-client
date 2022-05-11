class User < ApplicationRecord
    # macros - associations/db-relationships
    has_many :wooblies


    # This Activates Bycrpt for our :password_digest
    has_secure_password

    validates :name, presence: true

    #X# valitates :password, presence: true
    ####  This is a NO-NO Because  
    ####  has_secure_password is already handling that




    # Class/Scope Methods
    # ....

    # Instance Methods
    # .... 

end
