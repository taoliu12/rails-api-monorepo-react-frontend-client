class SessionsController < ApplicationController
  

  def create
      # def login 

      # params{  username=>"" , password=>""  }
      # byebug

      user_to_find_to_login = User.find_by( username: params[:username] )

      if user_to_find_to_login  #Now We Want to Verify their Password


          if user_to_find_to_login.authenticate( params[:password] )


            # THIS IS THE LINE
              session[:user_id] = user_to_find_to_login.id


              # render json: session[:user_id]
              render json: user_to_find_to_login

          else 

              render json: { error: "** Check Your Password **" }

          end


      else

          render json: { error: "Username OR Password Don't Match" }
          # render json: { error: "No Username Matches / Username Doesn't Exists" }

      end



  end

  def destroy
    # def logout

    session.delete( :user_id )

    # head :no_content

    render json: {}

  end



    def get_logged_in_user

        user_already_loggedin = User.find_by( id: session[:user_id] ) 
        render json: user_already_loggedin        

        # byebug

    end

    # def get_logged_in_user
    #     # byebug
    #     session[:count] = (session[:count] || 0) + 1
    #     render json: { count: session[:count] }
    # end





end
