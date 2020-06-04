class ItemsController < ApplicationController
before_action :move_to_index, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(
      name: item_params[:name],
      price: item_params[:price],
      user_id: current_user.id,
      image_name: "default_item.jpg"
     )
     if params[:image]
       @item.image_name = "#{@item.id}.jpg"
       image = params[:image]
       File.binwrite("public/item_images/#{@item.image_name}", image.read)
     end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
