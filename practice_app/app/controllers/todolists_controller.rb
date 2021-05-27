class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params) #データを新規登録
    list.save #データベースに保存
    redirect_to todolist_path(list.id) #トップ画面へ
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データを1件取得
    list.destroy #データを削除
    redirect_to todolists_path #投稿一覧へリダイレクト
  end


  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end

end
