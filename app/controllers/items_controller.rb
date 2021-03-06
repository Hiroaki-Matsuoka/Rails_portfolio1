class ItemsController < ApplicationController
before_action :move_to_index, except: :index

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(
      name: item_params[:name],
      price: item_params[:price],
      user_id: current_user.id,
      image_name: "default_item.jpg",
      # image: item_params[:image],
      message: item_params[:message]
     )
     if params[:item][:image]
       @item.image_name = "#{@item.id}.jpg"
       @item.save
       image = params[:item][:image]
       File.binwrite("public/item_images/#{@item.image_name}", image.read)
     end
     redirect_to item_path(@item)
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.name = params[:item][:name]
    @item.price = params[:item][:price]
    @item.image = params[:item][:image]
    @item.message = params[:item][:message]
    @item.update(item_params)

    if params[:item][:image]
      @item.image_name = "#{@item.id}.jpg"
      @item.save
      image = params[:item][:image]
      File.binwrite("public/item_images/#{@item.image_name}", image.read)
    end
    redirect_to users_path
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
    params.require(:item).permit(:name, :price, :image, :message, :image_name)
  end
end
