class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :posted]
  
  def index
    set_serch
  end
  
  def new
    @room = Room.new
  end 
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
      flash[:notice] = "部屋が登録されました"
    else
      redirect_to root_path
      flash[:alert] = "登録に失敗しました"
    end 
  end 
  
  def posted
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def show
    @room = Room.find(params[:id])
    @profile = Profile.find_by(user_id: @room.user_id)
    @reservation = Reservation.new(room_id: params[:id])
  end 
  
  private
    def room_params
      params.require(:room).permit(:roomname, :image, :description, :fee, :address).merge(user_id: current_user.id)
    end
end
