class ApplicationController < ActionController::API


    include ActionController::Cookies
    

    # def get_logged_in_user

    #     user_already_loggedin = User.find_by( id: session[:user_id] )

    #     render json: user_already_loggedin        

    #     # byebug

    # end

    # def get_logged_in_user
    #     # byebug
    #     session[:count] = (session[:count] || 0) + 1
    #     render json: { count: session[:count] }
    # end


end
