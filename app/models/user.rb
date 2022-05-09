class User < ApplicationRecord
    # macros - associations/db-relationships
    has_many :wooblies

    # This Activates Bycrpt for our :password_digest
    has_secure_password


    # Class/Scope Methods
    # ....

    # Instance Methods
    # .... 

end
