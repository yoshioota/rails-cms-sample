class UController < ApplicationController

  before_action :set_user

  def show

  end

  def set_user
    @user = User.where(screen_name: params[:id]).first
  end
end
