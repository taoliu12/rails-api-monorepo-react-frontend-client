class WoobliesController < ApplicationController


    def index

        render json: Woobly.all
    
    end 




    # POST to /wooblies  ==  [C]RUD : CREATE
    def create

        # byebug

        # params{ name=>"qwertyuiop" }


        #### Backend Approach - Using SessionsHash + .build() + .save


            logged_in_user = User.find_by( id: session[:user_id] )

            if logged_in_user

                new_woobly = logged_in_user.wooblies.build( woobly_create_params )
                ##  logged_in_user.wooblies -> [ {}{}{} ]
                ##  logged_in_user.wooblies -> [ {}{}{} ] << new_woobly( woobly_create_params )
            

                # byebug


                if new_woobly.save

                    render json: new_woobly

                else

                    new_woobly.errors.full_messages

                end

            end


        #### Backend Approach - Using SessionsHash + .build() + .save




        # #### Backend Approach - Using SessionsHash + .create() (Associated-Way)


        #     logged_in_user = User.find_by( id: session[:user_id] )

        #     if logged_in_user

        #         new_woobly = logged_in_user.wooblies.create( woobly_create_params )
        #         ##  logged_in_user.wooblies -> [ {}{}{} ]
        #         ##  logged_in_user.wooblies -> [ {}{}{} ] << new_woobly( woobly_create_params )


        #         if new_woobly.valid?

        #             render json: new_woobly

        #         else

        #             render json: new_woobly.errors.full_messages

        #         end

        #     end


        # #### Backend Approach - Using SessionsHash + .create() (Associated-Way)








        # #### Backend Approach - Adding a Key-Value-Pair to Params Hash

        #     params[:user_id] = session[:user_id]
        #     ##  This will ADD a key-value pair our ParamsHash
        #     ##  params{ name=>"qwertyuiop" , user_id => "4" 


            # ####  Using .new + TRUTHY/FALSY LOGIC

            #     new_woobly = Woobly.new( woobly_create_params )

            #         #######  Using . save

            #         if new_woobly.save # !! Has .valid? Built Into It

            #             render json: new_woobly

            #         else

            #             render json: { errors: new_woobly.errors.full_messages }

            #         end

            #         #######  Using . save

            # ####  Using .new + TRUTHY/FALSY LOGIC


        # #### Backend Approach - Adding a Key-Value-Pair to Params Hash


    end




    private


    def woobly_create_params

        params.permit(:name, :user_id)

    end




end
