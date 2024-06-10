class MypagesController < ApplicationController
  def show
    @article = current_user.articles.page(params[:page])
  end
end
