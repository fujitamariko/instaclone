class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1 or /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures or /pictures.json
  def create
    @picture = Picture.new(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"ブログを削除しました！"
  end

  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:user_id, :title, :content, :image)
    end
end
