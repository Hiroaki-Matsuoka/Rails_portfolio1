class MenusController < ApplicationController

  def new
    @menu = Menu.new
    @place = Place.find_by(id: params[:id])
  end

  def create
    @menu = Menu.create(
      title: menus_params[:title],
      price: menus_params[:price],
      message: menus_params[:message],
      image: menus_params[:image],
      place_id: menus_params[:place_id]
    )
    if params[:menu][:image]
      @menu.image_name = "#{@menu.id}.jpg"
      @menu.save
      image = params[:image]
      File.binwrite("public/menu_images_#{@menu.image_name}", image.read)
    end
    redirect_to("/places/#{@menu.place_id}")
  end

  def show
    @menu = Menu.find_by(id: params[:id])
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to place_path(menu.place_id)
  end

  private

  def menus_params
    params.require(:menu).permit(:title, :price, :message, :image_name, :image, :place_id)
  end

end
