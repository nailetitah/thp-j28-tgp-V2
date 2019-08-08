class UsersController < ApplicationController

  def index
    @users = User.all.order("created_at DESC")
  end

  def show 
    @user = User.find(params[:id])
    @user_city = City.find(@user.city_id).name
    @user_gossips = @user.gossips
    @gossips_count = @user.gossips.count   
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "L'utilisateur a été ajouté."
      redirect_to @user
    else
      flash[:danger] = "Erreur."
      render 'new'
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "L'utilisateur a été modifié."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "L'utilisateur a été supprimé."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :password_confirmation, :city_id)
  end

  def find_user
    @user = User.find(params[:id])
  end

end