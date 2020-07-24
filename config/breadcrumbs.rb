  # crumb コントローラー名_アクション名 do
  #   link "パンくず名にしたい名前", path
  #   (parent :親メソッド) ← 子メソッドを記述する場合に用いる
  # end

crumb :root do
  link "Home", root_path
end

crumb :users do
  link "#{current_user.nickname}のマイページ", new_user_registration_path
  parent :root
end

crumb :profiles_index do
  link "本人確認情報",user_profiles_path(current_user)
  parent :users
end


crumb :send_informations_index do 
  link "お届け先住所", user_send_informations_path(current_user)
  parent :users
end

crumb :send_information_new do
  link "お届け先住所登録", new_user_send_information_path
  parent :send_informations_index
end

crumb :send_information_edit do
  link "お届け先住所変更", edit_send_information_path
  parent :send_informations_index
end


crumb :new_credit do 
  link "支払方法確認",  new_credit_path
  parent :users
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).