class ItemsController < ApplicationController
  # before_action :set_current_user_items,only:[:p_transaction,:p_exhibiting,:p_soldout]
  # before_action :set_user,only:[:p_transaction,:p_exhibiting,:p_soldout]

  require 'payjp'

  before_action :set_item, only:[:show, :buy, :pay, :destroy]
  before_action :set_category, only:[:show]
  before_action :authenticate_user!, except:[:show, :index]



  def p_exhibiting #出品中のアクション
  end

  def p_transaction #取引中のアクション
  end

  def p_soldout #売却済みのアクション
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def show
    @items = Item.where.not(id: @item.id).where(itemcategory_id: @item.itemcategory_id)
  end

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def buy
    if @item.seller.id == current_user.id || @item.buyer_id
      if @item.seller.id == current_user.id
        flash.now[:alert] = "出品者は購入手続きはできません"
      else
        flash.now[:alert] = "この商品は既に購入されています"
      end
      set_category
      render :show
    end
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.build()
    set_category_sellector
  end

  def get_itemcategory_children
    @itemcategory_children = Itemcategory.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_itemcategory_grandchildren
    @itemcategory_grandchildren = Itemcategory.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html{redirect_to root_path}
      end
    else
      set_category_sellector
      flash.now[:alert] = "必須項目を入力してください"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @itemcategory = Itemcategory.where(ancestry: nil).pluck(:name).unshift("選択してください")
    set_category_sellector
    if current_user.id != @item.seller_id
      flash.now[:alert] = "編集は出品者しかできません"
      set_category
      render :show
    end
  end


  def update
    @item = Item.find(params[:id])
    if current_user.id != @item.seller_id
      flash.now[:alert] = "編集は出品者しかできません"
      set_category_sellector
      render :edit and return
    end
    length = @item.images.length
    i = 0
    while i < length do
      if  item_update_params[:images_attributes]["#{i}"]["_destroy"] == "0"
        @item.update(item_update_params)
        redirect_to item_path(@item.id), notice: "編集が完了しました"
        return
      else
        i += 1
      end
    end
    if item_update_params[:images_attributes]["#{i}"]
      @item.update(item_update_params)
      redirect_to item_path(@item.id), notice: "編集が完了しました"
    end
    redirect_to edit_item_path(@item.id), alert: "画像は１枚以上挿入してください"
    return
  end

  def pay
    if @item.buyer_id
      flash.now[:alert] = "商品は既に売却済みでした"
      root_path
    end

    if current_user.id == @item.seller_id
      flash.now[:alert] = "出品者は購入できません。"
      root_path
    end

    unless current_user.credit || @item.send_informations
      flash.now[:alert] = "カード登録もしくは配送先登録がが未了です"
      render :buy
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP][:payjp_secret_key]
      customer = Payjp::Customer.retrieve(current_user.credit.customer_id)
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: customer[:id],
        currency: 'jpy'
      )
      if charge.paid
        @item.buyer_id = current_user.id
        @item.save
        redirect_to root_path, alert: "購入完了しました"
      else
        flash.now[:alert] = "購入処理に失敗しました"
        render :buy
      end

    end

  end


  def destroy
    if @item.seller.id == current_user.id
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
      :name, :price, :produce, :deliveryfee_id, :brand_id, :itemcategory_id, :condition_id, :prefecture_id, :deliverydate_id,
      [images_attributes: [:image, :_destroy, :id]])
  end

  def set_category
    @grandchild = Itemcategory.find(@item.itemcategory_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def set_category_sellector
    @itemcategory = Itemcategory.where(ancestry: nil).pluck(:name).unshift("選択してください")
  end



  # 下記は使用しないため、一旦コメントアウトします。

  # def set_current_user_products
  #   if user_signed_in?
  #     @items = current_user.products.includes(:seller, :buyer, :auction, :item_images)
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end

  # def set_user
  #   @user = User.find(seller_id: current_user.id)
  # end

end

