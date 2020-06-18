class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.create(
      name: place_params[:name],
      user_id: current_user.id,
      image: place_params[:image],
      message: place_params[:message]
    )
    if params[:place][:image]
      @place.image_name = "#{@place.id}.jpg"
      @place.save
      image = params[:place][:image]
      File.binwrite("public/place_images/#{@place.image_name}", image.read)
    end
  end

  def edit
    @place = Place.find_by(id: params[:id])
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.name = params[:name]
    @place.message = params[:message]
    @place.image = params[:image]
    @place.update(place_params)
    if params[:place][:image]
      @place.image_name = "#{@place.id}.jpg"
      @place.save
      image = params[:place][:image]
      File.binwrite("public/place_images/#{@place.image_name}", image.read)
    end
  end

  def show
    # placeのidをここで受け取れているのを確認(users show → place show)
    @place = Place.find_by(id: params[:id])
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
  end

  private

  def place_params
    params.require(:place).permit(:name, :message, :image_name, :image)
  end
end
