# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# number_of_users = 3
# number_of_users.times do |n|

#  email = "user00#{(n += 1)}@test.com"
#  password = 'test1234'

#   user = User.find_or_create_by!(email: email) do |user|
#    user.password = password
#    # Userモデルのインスタンス（user）のpassword属性に変数passwordの値（='test1234'）を代入
#   end

#   number_of_articles = 3
#   number_of_articles.times do |i|

#    title = "No.#{(i += 1)}:user00#{(n += 1)}の記事"
#    content = "No.#{(i += 1)}:user00#{(n += 1)}の記事の本文"

#     Article.find_or_create_by!(user: user, title: title) do |article|
#      article.content = content
#     end
#   end
# end


number_of_users = 3
number_of_users.times do |n|
  user_number = n + 1
  email = format('user%03d@test.com', user_number)
  # formatメソッド使用。'user%03d@test.com'はフォーマット文字列。%03dは、整数を3桁の数値として0埋めで表示する。
  password = 'test1234'

  user = User.find_or_create_by!(email: email) do |u|
    u.password = password
  end

  number_of_articles = 50
  number_of_articles.times do |i|
    article_number = i + 1
    title = "No.#{article_number}: user#{format('%03d', user_number)}の記事"
    content = "No.#{article_number}: user#{format('%03d', user_number)}の記事の本文"

    Article.find_or_create_by!(user: user, title: title) do |article|
      article.content = content
    end
  end
end
