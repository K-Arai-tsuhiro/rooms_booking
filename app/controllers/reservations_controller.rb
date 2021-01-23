class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: %i(create index)
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to :root
      flash[:notice] = "予約完了しました"
    else
      redirect_to @reservation.room
      flash[:alert] = @reservation.errors.full_messages
    end 
  end 
  
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end
  
  private 
    def reservation_params
      params.require(:reservation).permit(:start_at, :end_at, :persons, :room_id).merge(user_id: current_user.id)
    end
end
