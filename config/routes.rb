Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  # contorollerにフォームデータを送信するのでpost
 
  post 'todolists' => 'todolists#create'
  # new画面で新規投稿された時にpostされこのcontorollerへ処理がつながる
  get 'todolists' => 'todolists#index'
  get 'todolists/:id' => 'todolists#show', as:'todolist'
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist' 
  # 新規投稿のHTTPメソッドは、POSTを使用、一方、更新の場合はPATCHで指定
  delete 'todolists/:id' => 'todolists#destroy',as:'destory_todolist'

end
