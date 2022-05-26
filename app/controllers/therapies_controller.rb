class TherapiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]


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
    @comments = @therapy.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @therapy = Therapy.find(params[:id])
    unless @therapy.user_id == current_user.id
      redirect_to action: :index
    end
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

  def search
    # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:title)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:title].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:title_cont_any] = squished_keywords.split(" ")
    end
    @q = Therapy.ransack(params[:q])
    @therapies = @q.result
  end

  private

  def therapy_params
    params.require(:therapy).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
end
