class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		order = Order.find(params[:id])
		order.update(order_params)
		if order.order_status_before_type_cast == 1
			order_detiles = order.order_detiles
			order_detiles.each do |order_detile|
				order_detile.production_status = 1
				order_detile.update(order_detile_params)
			end
		end
		redirect_to admin_order_path(order.id)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

	def order_detile_params
		params.permit(:production_status)
	end
end
