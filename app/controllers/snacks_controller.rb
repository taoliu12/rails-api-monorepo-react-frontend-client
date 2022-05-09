class SnacksController < ApplicationController

    def index
        
        render json: Snack.all

    end


    def woobly

        byebug

        render json: { message: "hello :P" }

    end

end
