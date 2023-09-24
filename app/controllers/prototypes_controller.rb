class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :no_match, only: [:edit]
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    # prototype_paramsをしたで呼び出す
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.create(prototype_params)
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to "/prototypes/#{prototype.id}"
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  
  private

  def prototype_params
    params.require(:prototype).
    permit(:title, :catch_copy, :concept, :image, :name).
    merge(user_id: current_user.id)
  end

  def no_match
    unless @prototype && current_user.id == @prototype.user_id
      redirect_to root_path
    end
  end

end
