class UserController < ApplicationController
    def new
        @user = User.new
    end
    def create
        if user.save(user_params)
            sign_in(user)
            flash(:success) = "Signup Sucessful"
            redirect_to root_path
        else
            flash(:warning) = "Signup Failed. Please try again"
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
