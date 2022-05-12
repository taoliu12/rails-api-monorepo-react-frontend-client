class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email  ,  ## Database/Migration/Actual User Attributes

  #  ,

  ## Custom Serilized Attributes
    
    :my_wooblies

  ## Custom Serilized Attributes

  

  
  #, :password_digest 
  
  #X# :password
  ####  We DON'T Want This
  ####  This would be sending back folks' Plain Text Passwords
  ####  If You Use it - It SHOULD Be Returning:  null


  def my_wooblies

    formated_wooblies = []

    object.wooblies.each do | each_woobly | 

      formated_woobly  = {
        
        name: each_woobly.name ,
        user: each_woobly.user,
        snacks: each_woobly.snacks
        # ****  Can Continue if We Want Prices  ****
        
      }

      formated_wooblies << formated_woobly
    
    end

      # puts self         -> SerializerInstance
      # puts self.object  -> Actual UserInstance
      # puts object       -> Actual UserInstance

      # self.object == object : BECAUSE -> Implicit Self 

    formated_wooblies

  end
  # has_many :wooblies, each_serializer: WooblySerializer



end
# :password