class MypagesController < ApplicationController
  def show
    @article = current_user.articles
  end
end
