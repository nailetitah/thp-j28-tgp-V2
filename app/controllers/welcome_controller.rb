class WelcomeController < ApplicationController
  def show
    @user = params[:id].capitalize
  end
end
