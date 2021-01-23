class UsersController < ApplicationController
  before_action :current_user_or_not, only: %i(show)
  
  def show
    @user = User.find(params[:id])
  end

  private
  
    def current_user_or_not
      unless current_user == User.find(params[:id])
        flash[:alert] = "ログイン中のアカウント以外のアカウント情報は表示できません"
        redirect_to :root 
      end
    end
end
