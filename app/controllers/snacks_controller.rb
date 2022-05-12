class SnacksController < ApplicationController

    def index
        
        render json: Snack.all

    end


    #### Was Just for Custom Route Example

        # def woobly

        #     byebug

        #     render json: { message: "hello :P" }

        # end
        
    #### Was Just for Custom Route Example


end
