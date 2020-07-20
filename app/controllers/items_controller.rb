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

  def set_item
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where.not(id: @item.id).where(itemcategory_id: @item.itemcategory_id)
    @parent = Itemcategory.find(@item.itemcategory_id)
    @child = @parent.parent
    @grandchild = @child.parent
    @nickname = User.find(@item.seller_id).nickname 
  end

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def buy
    if @item.seller.id == current_user.id
      flash.now[:alert] = "出品者は購入手続きはできません"
      render :show
    end
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.build()
    @itemcategory = ["選択してください"]
    Itemcategory.where(ancestry: nil).pluck(:name)
    Itemcategory.where(ancestry: nil).each do |parent|
      @itemcategory << parent.name
    end
  end

  def get_itemcategory_children  
    @itemcategory_children = Itemcategory.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_itemcategory_grandchildren
    @itemcategory_grandchildren = Itemcategory.find("#{params[:child_id]}").children
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

  def pay
    if @item.buyer_id
      flash.now[:alert] = "商品は既に売却済みでした"
      root_path
    end
    unless current_user.credit || @item.send_informations
      flash.now[:alert] = "カード登録もしくは配送先登録がが未了です"
      render :buy
    else
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(current_user.credit.customer_id)
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: customer[:id],
        currency: 'jpy'
      )
      if charge.paid
        @item.buyer_id = current_user.id
        @item.save
        redirect_to root_path
      else
        flash.now[:alert] = "購入処理に失敗しました"
        render :buy
      end

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

private

  def item_params
    params.require(:item).permit(:name, :price, :produce, :deliveryfee_id, :brand_id, :itemcategory_id, :condition_id, :prefecture_id, :deliverydate_id, images_attributes: [:image, :id]).merge(seller_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(
      :name,
      [images_attributes: [:image, :_destroy, :id]])
  end


end

