class ItemsController < ApplicationController

  require 'payjp'

  before_action :set_item, only:[:show, :buy, :pay]

  def show
    @items = Item.where.not(id: @item.id).where(category_id: @item.category_id)
  end

  def index
  end

  def buy
    if @item.selleruser.id == current_user.id
      flash.now[:alert] = "出品者は購入手続きはできません"
      render :show
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

end

