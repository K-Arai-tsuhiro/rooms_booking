class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update show)
  before_action :set_profile, only: %i(edit update show)
  before_action :current_user_profile_or_not, only: %i(edit update)
  
  def edit
  end 
  
  def update
    if @profile.update_attributes(profile_params)
      flash[:notcie] = "プロフィールが更新されました"
      redirect_to :profile
    else
      flash[:alert] = @profile.errors.full_messages
      render action: :edit
    end
  end
  
  def show
  end
  
  private
    
    def profile_params
      params.require(:profile).permit(:profile_photo, :introduction).merge(user: current_user)
    end
    
    def set_profile
      @profile = Profile.find(params[:id])
      @user = User.find(@profile.user_id)
    end
    
    def current_user_profile_or_not
      unless current_user == User.find(params[:id])
        flash[:alert] = "ログインしてください"
        redirect_to :root
      end
    end
end