class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.create(place_params)
    if params[:place][:image]
      @place.image_name = "#{@place.id}.jpg"
      @place.save
      binding.pry
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
