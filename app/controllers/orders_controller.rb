class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, :sold_out
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:order_id, :postal_code, :prefecture_id, :city, :addresses, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def correct_user
    item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def sold_out
    item = Item.find(params[:item_id])
    if item == item.order.present?
      redirect_to root_path
    end
  end

end
