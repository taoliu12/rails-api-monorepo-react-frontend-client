class WooblySnacksController < ApplicationController


    # POST to /woobly_snacks
    def create

       byebug
       
       new_woobly_snack = WooblySnack.new( woobly_snack_create_params )

       if new_woobly_snack.save

        render json: new_woobly_snack

       else

        render json: { errors: new_woobly_snack.errors.full_messages }
        
       end

    end




    private

    def woobly_snack_create_params

        params.permit(:price, :woobly_id, :snack_id)        

    end



end
