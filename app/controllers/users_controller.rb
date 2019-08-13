class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "SignUp Sucessful"
      sign_in(user)
      redirect_to root_path
    else
      flash.now[:warning] = "Sign Up failed. Try Again"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(creator: @user)
    date = Date.current
    @future_events = @user.created_events.future_events
    @past_events = @user.created_events.past_events
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
