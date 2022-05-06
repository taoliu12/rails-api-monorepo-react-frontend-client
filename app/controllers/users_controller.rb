class UsersController < ApplicationController


    def index
    
        # all_of_our_users = User.all

        # render json: all_of_our_users


        render json: User.all

    end

    
end
