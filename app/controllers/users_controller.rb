class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(user_params)

        if @user.save
            render json: @user, status: 200
        else
            render json: @user.errors, status: 422
        end
    end

    # def create
    #     @cat = User.create(cat_params)

    #     if cat.valid?
    #         render json: cat
    #     else
    #         render json: cat.errors, status: :unprocessable_entity
    #     end
    # end


    private

    def user_params
        params.require(:user).permit(:user, :profile_pic, :project_link, :focus)
    end
end
