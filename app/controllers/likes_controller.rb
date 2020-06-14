class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.create(
      user_id: current_user.id,
      place_id: params[:place_id]
    )
    @like.save
    redirect_to("/places/#{params[:place_id]}")
  end

  def destroy
    @like = Like.find_by(
      user_id: current_user.id,
      place_id: params[:place_id]
    )
    @like.destroy
    redirect_to("/places/#{params[:place_id]}")
  end
end
