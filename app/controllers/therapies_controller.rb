class TherapiesController < ApplicationController


  def index
    @therapies = Therapy.all
  end

  def new
    @therapy = Therapy.new
  end

  def create
    @therapy = Therapy.new(therapy_params)
    if @therapy.save
      redirect_to root_path(@therapy)
    else
      render :new
    end
  end

  def show
    @therapy = Therapy.find(params[:id])
  end

  def edit
    @therapy = Therapy.find(params[:id])
  end

  def update
    @therapy = Therapy.find(params[:id])
    if @therapy.update(therapy_params)
      redirect_to therapy_path
    else
      render :edit
    end
  end

  def destroy
    therapy = Therapy.find(params[:id])
    therapy.destroy
    redirect_to root_path
  end

  private

  def therapy_params
    params.require(:therapy).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
end
