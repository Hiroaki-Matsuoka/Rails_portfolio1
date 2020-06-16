class MenusController < ApplicationController

  def new
    @menu = Menu.new
    @place = Place.find_by(id: params[:format])
    binding.pry
  end

  def create
    @place = Place.find_by(params[:format])
    @menu = Menu.create(
      title: menus_params[:title],
      price: menus_params[:price],
      message: menus_params[:message],
      image: menus_params[:image],
      place_id: "#{@place.id}"
    )
    binding.pry
    if params[:menu][:image]
      @menu.image_name = "#{@menu.id}.jpg"
      @menu.save
      image = params[:image]
      File.binwrite("public/menu_images_#{@menu.image_name}", image.read)
    end
  end

  def show
    @menus = Menu.find_by(id: params[:id])
  end

  private

  def menus_params
    params.require(:menu).permit(:title, :price, :message, :image_name, :image, :place_id)
  end

end
