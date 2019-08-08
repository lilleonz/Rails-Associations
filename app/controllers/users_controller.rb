class UsersController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        user = User.new(user_params)
        if user.save
          flash[:notice] = "SignUp Sucessful"
          sign_in(user)
          redirect_to show_path
        else
          flash.now[:warning] = "Sign Up failed. Try Again"
          render "new"
        end
      end

      def show
        @user = User.find(current_user.id)
      end

      private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
