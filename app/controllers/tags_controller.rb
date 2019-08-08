class TagsController < ApplicationController
  
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "Le potin a été ajouté."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @tags = Tag.all
  end

  def tag_params
    params.require(:tag).permit(:title, :user_ids)
  end


end
