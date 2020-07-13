class ItemsController < ApplicationController

  require 'payjp'

  before_action :set_item, only:[:show, :buy, :pay, :destroy]

  def show
    @item = Item.find(params[:id])
    @items = Item.where.not(id: @item.id).where(itemcategory_id: @item.itemcategory_id)
    #商品出品機能の実装後に実装したい為、一時的にコメントアウト
    #@parent = Itemcategory.find(@item.itemcategory_id)
    #@child = @parent.children
    #@grandchild = @child.
  end

  def index
    @parents = Itemcategory.where(ancestry: nil)
  end

  def buy
    if @item.selleruser.id == current_user.id
      flash.now[:alert] = "出品者は購入手続きはできません"
      render :show
    end
    @item = Item.find(params[:id])
  end

  def new
  end

  def pay
    unless current_user.credit
      flash.now[:alert] = "購入にはクレジットカード登録が必須です"
      render :buy
    else
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(current_user.credit.customer_id)
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: customer[:id],
        currency: 'jpy'
      )
      redirect_to root_path

    end

  end

  def destroy
    if @item.selleruser.id == current_user.id
      if @item.destroy
        redirect_to root_path, notice: "削除が完了しました"
      else 
        redirect_to root_path, alert: "削除が失敗しました"
      end
    else
      redirect_to root_path, alert: "ユーザーが一致していません"
    end 
  end 

  private

  def set_item
    @item = Item.find(params[:id])
  end

  
end

