class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :event, only: [:edit, :show, :destroy]

  def index
    @future_events = Event.future_events
    @past_events = Event.past_events
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Your event has been created.'
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = 'Your event has been updated.'
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = 'Event has been cancelled.'
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :description)
  end

  def event
    @event = Event.find(params[:id])
  end

  def logged_in_user
    unless signed_in?
      flash[:info] = 'You must be logged in to do that.'
      redirect_to signin_path
    end
  end

  def correct_user
    @user = Event.find(params[:id]).creator
    unless @user == current_user
      flash[:danger] = 'You are not authorized.'
      redirect_to root_path
    end
  end
end