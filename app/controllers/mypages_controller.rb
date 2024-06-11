class MypagesController < ApplicationController
  def show
    if params[:title].present? # 検索フォームに入力された情報が存在するか判断
      # SQLのLIKE句を使ったあいまい検索の構文
      @article = current_user.articles.where('title LIKE ?', "%#{params[:title]}%").page(params[:page])
    else # 検索フォームに何も入力されていない場合は自分の記事一覧表示とする
      @article = current_user.articles.page(params[:page])
    end
  end
end
