class TodolistsController < ApplicationController
  
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
   @list = List.new
  end
  
  def create
    # １. データを新規登録するためのインスタンス作成　# listDBから取ってきた新規の情報をlistに代入
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to todolist_path(list.id)
    # <!--todolist_pathと表示できるのは、routesでget 'todolists/:id' => 'todolists#show', as:'todolist'と設定しているから????-->
    # _pathの使い方がイマイチわからない...
  end

  def index
    @lists = List.all 
    # すべてのデータが取り出されて格納されるため、インスタンス変数名を複数形にしている　1つのデータでいい場合は@listをインスタンスに使用する
  end

  def show
    @list = List.find(params[:id])
    # レコード1件を取得するので、インスタンス変数名は単数形の「@list」
    # params[:id]でrouteで受け取ったidを取れる 
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    # この文はどういう意味？list変数に入った情報のupdateコラムを引き出す？list_paramsはどいいう意味？
    redirect_to todolist_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path  # 投稿一覧画面へリダイレクト
    # 投稿一覧index(todolists_path:getの場合なので)
  end
  
  # privateより後に定義されたメソッドは、アクションとして認識されなくなる
  # privateメソッドの名前は、「モデル名_params」とすることが多い
  private
  def list_params
    params.require(:list).permit(:title,:body,:image)
    # 公式で確認
    # list（キー）モデルに対して、title,body,imageコラムを抽出したい
    # permitメソッドを使用する事で、許可された値のみを取得することができる
  end
end
