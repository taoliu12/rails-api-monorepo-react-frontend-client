class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email  #, :password_digest 
  #X# :password
  ####  We DON'T Want This
  ####  This would be sending back folks' Plain Text Passwords
  ####  If You Use it - It SHOULD Be Returning:  null

end
# :password