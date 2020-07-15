class ItemsController < ApplicationController
  # before_action :set_current_user_items,only:[:p_transaction,:p_exhibiting,:p_soldout]
  # before_action :set_user,only:[:p_transaction,:p_exhibiting,:p_soldout]

  def p_exhibiting #出品中のアクション
  end

  def p_transaction #取引中のアクション
  end

  def p_soldout #売却済みのアクション
  end

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
    # @items = Item.includes(:images).order('id ASC')
    # @images = Image.order('item_id ASC')
    # @thumbnail = @item.images.first
    # @image = @item.images.find(params[:id])
    # @image = @item.images.find_by(id: image.id)
    
    # @image = Item.images.find(params[:id])
    # @image = Item.images.find_by(id: image.id)
    @items = Item.includes(:images).order('created_at DESC')
  end

  def buy
    if @item.selleruser.id == current_user.id
      flash.now[:alert] = "出品者は購入手続きはできません"
      render :show
    end
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.build()
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      respond_to do |format|
        format.html{redirect_to root_path}
      end
    else
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    # 編集機能実装で使用するため、一旦コメントアウトしてます。
    
    # @item = Item.find(params[:id])
    # length = @item.images.length
    # i = 0
    # while i < length do
    #   if  item_update_params[:images_attributes]["#{i}"]["_destroy"] == "0"
    #     @item.update(item_update_params)
    #     redirect_to edit_item_path(@item.id)
    #     return
    #   else
    #     i += 1
    #   end
    # end
    # if item_update_params[:images_attributes]["#{i}"]
    #   @item.update(item_update_params)
    # end
    # redirect_to edit_item_path(@item.id)
    # return
  end

  private

  def set_current_user_products
    if user_signed_in?
      @items = current_user.products.includes(:seller, :buyer, :auction, :item_images)
    else
      redirect_to new_user_session_path
    end
  end

  def set_user
    @user = User.find(seller_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:name, :price, :produce, :deliveryfee_id, :brand_id, :itemcategory_id, :condition_id, :prefecture_id, :deliverydate_id, images_attributes: [:image, :id]).merge(seller_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(
      :name,
      [images_attributes: [:image, :_destroy, :id]])
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

