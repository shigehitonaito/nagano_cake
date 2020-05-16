class Public::OrdersController < ApplicationController

	def index
	end

	def show
	end

	def new
		if params[:cart_item_amounts].to_i == 0
			flash[:no_items] = "カートに商品が入っていません。"
			redirect_to root_path
		end
		@sum = params[:sum_price]
		@order = Order.new
		@user = current_end_user
	end

	def create
		# orderのレコード作成
		order = Order.new
		order.name = params[:order_name]
		order.post_number = params[:order_post_number]
		order.address = params[:order_address]
		order.payment = params[:order_payment]
		order.postage = params[:order_postage]
		order.total_price = params[:order_total_price]
		order.end_user_id = current_end_user.id
		order.save
		# order_detileのレコード作成編
		cart_items = CartItem.where(end_user_id: current_end_user.id)
		cart_items.each do |cart_item|
		order_detile = OrderDetile.new
		order_detile.order_id = order.id
		order_detile.item_id = cart_item.item_id
		order_detile.amount = cart_item.amount
		order_detile.price = cart_item.item.untax_price*108/100
		order_detile.save
	    end
	    # cart_items削除編
	    cart_items.delete_all
	    redirect_to  public_orders_complete_path

	end

	def verification
		@order = Order.new
		@order.total_price = params[:sum_price]
		address = params[:address_choice]
		@order.end_user_id = current_end_user.id
		@order.postage = 800
		if address == "address1"
		  @order.address = current_end_user.address
		  @order.post_number = current_end_user.post_number
		  @order.name = current_end_user.family_name + current_end_user.first_name
		elsif address == "address2"
		  list_address = Address.find(params[:address])
		  @order.address = list_address.address
		  @order.post_number = list_address.post_number
		  @order.name = list_address.name
		elsif address == "address3"
		  @order.address = params[:new_address]
		  @order.post_number = params[:new_post_number]
		  @order.name = params[:new_name]
		else
			flash[:order] = "入力情報に誤りがあります。"
			redirect_to new_public_order_path
		 end
		 @cart_items = CartItem.where(end_user_id: current_end_user.id)
	end

	def complete
	end

	private
	def order_params
		params.require(:order).permit(:payment, :address, :post_number, :name, :total_price, :postage, :end_user_id)
	end

	def order_detile_params
		params.require(:order_detile).permit(:item_id, :amount, :price, :order_id, :production_status)
	end

end
