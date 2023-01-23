class UsersController < ApplicationController
    



    ## Rescues

        rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
        rescue_from ActiveRecord::RecordInvalid, with: :user_unable_to_create

    ## Rescues




    ## before_actions  // Shoutout Wu ✨💪🏾✨

        # before_action :user_find_method, only: [:show, :update, :delete ]
        before_action :user_find_method,   except: [:index, :create]

    ## before_actions




    # GET to /users  ==  C[R]UD : READ
    def index
    
        # all_of_our_users = User.all

        # render json: all_of_our_users


        render json: User.all

    end


    # GET to /users/:id  ==  C[R]UD : READ
    def show

        # user_to_find = User.find_by( id: params[:id] )
        # user_to_find = User.find_by_id( id: params[:id] )


            ## Rails Rescue - Exception Raisers
                # user_to_find = User.find!( id: params[:id] )
                # user_to_find = User.find_by!( id: params[:id] )
            ## Rails Rescue - Exception Raisers


            # byebug

            
            # found_user = user_to_find

            # render json: found_user


        if user_find_method  # we found a user == TRUTHY == True

            render json: user_find_method

        else # find_by returns nil == FALSY == False

            user_not_found  #User Not Found Method Returning Error Message

        end


    end



    # POST to /users  ==  [C]RUD : CREATE
    def create

        # byebug

        ####  Using .new + TRUTHY/FALSY LOGIC

        new_user = User.new( user_create_params )

            ########  Using . valid

            # if new_user.valid?

            #     # can do some other logic/process

            #     new_user.save

            #     render json: new_user

            # else

            #     render json: { errors: new_user.errors.full_messages }
                
            #     #X# user_unable_to_create( new_user )
            #     ####  We DON'T Have Access to the exception Hash/Object 
            #     ####  in our Jurisdiction

            # end

            ########  Using . valid


            #######  Using . save

            if new_user.save # !! Has .valid? Built Into It

                render json: new_user

            else

                render json: { errors: new_user.errors.full_messages }

            end

            #######  Using . save

        ####  Using .new + TRUTHY/FALSY LOGIC




        ####  Using .create + Rails/ActiveRecord Rescue


            # # .create ==  .new + .save
            # new_user = User.create!( user_create_params )

            # render json: new_user


        ####  Using .create + Rails/ActiveRecord Rescue


    end




    # PATCH to /user/:id  ==  CR[U]D : UPDATE
    def update


            # user_find = User.find_by( id: params[:id] )


        if user_find_method  # Did We Find the User?


            if  user_find_method.update( user_update_params )
                ## OKAY, BUT -- Did the User Update Properly
                ## Are They Now Still Valid?
        

                    # updated_user = user_find

                    # render json: updated_user

                render json: user_find_method


            else  ## They (the User) ARE NO LONGER VALID  :(

                render json: { errors: user_find_method.errors.full_messages }

            end


        else

            user_not_found

        end
        

    end




    # DELETE to /user/:id  ==  CRU[D] : DESTROY/DELETE
    def destroy

            # user_find = User.find_by( id: params[:id] )

        if user_find_method

                destroy_response = user_find_method
                ## Holding on to a Copy of the Data, before it's destoryed
                ## So we can send it back

            user_find_method.destroy

            # head :no_content

            # render json: {}


            render json: destroy_response.id
            # render json: destroy_response
                ## Sending back some response data
        
        else

            user_not_found

        end


    end




    #### UsersController - Custom Controller Actions

        def my_wooblies

            logged_in_user = User.find_by( id: session[:user_id] )

            render json: logged_in_user.wooblies

        end

    #### UsersController - Custom Controller Actions




    private  


    ################# Any thing Blow this Key-Word == is Private
    ################# Only Accessible in this File/Controller


    
    #### Strong Params

        def user_create_params
            # If You Have Wrap Params
            params.permit(:name, :username, :email, :password)

            # If You Don't Have Wrap Params Disabled
            # params.require(:user).permit(:name, :username, :email, :password)
        end


        def user_update_params
            # If You Have Wrap Params
            params.permit(:name, :username, :email, :password)

            # If You Don't Have Wrap Params Disabled
            # params.require(:user).permit(:name, :username, :email, :password)
        end

    #### Strong Params




    #### Private Contorller Methods


        def user_find_method

            user_to_find = User.find_by( id: params[:id] )

        end


        # Issue Finding a User
        def user_not_found
            render json: { error: "User Not Found" }
            # render json: { errors: ["User Not Found"] }
        end


        # Issue Creating a User
        def user_unable_to_create( the_invalid_user_exception ) 


            # render json: { error: the_invalid_user_exception }
            # {
            #     "error": "Validation failed: Password can't be blank"
            # }


            render json: { errors: the_invalid_user_exception.record.errors.full_messages }
            # {
            #     "errors": [
            #         "Password can't be blank"
            #     ]
            # }


            #X# render json: { errors: the_invalid_user.errors.full_messages }
            ####  When interacting with an Exception - the key-value pairs are set differently
            ####  than directly with the invalid instance


        end


    #### Private Contorller Methods



    
end
