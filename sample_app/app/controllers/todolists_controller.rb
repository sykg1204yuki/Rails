class TodolistsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    list = List.new(list_params) #データの新規登録
    list.save #データの保存
    redirect_to todolist_path(list.id) #詳細画面へリダイレクト
  end 
  
  def index
    @lists = List.all
  end 
  
  def show
    @list = List.find(params[:id])
  end 
  
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end 
  
  
end


