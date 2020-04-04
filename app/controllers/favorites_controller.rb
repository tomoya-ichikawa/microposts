class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post= Micropost.find(params[:micropost_id])
    current_user.liking(post)
    flash[:success] = 'お気に入り登録しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post=Micropost.find(params[:micropost_id])
    current_user.unlike(post)
    flash[:success] = 'お気に入り解除しました'
    redirect_back(fallback_location: root_path)
  end
end
