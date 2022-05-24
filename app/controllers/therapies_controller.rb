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

  private

  def therapy_params
    params.require(:therapy).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
end
