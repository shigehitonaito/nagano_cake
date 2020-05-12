class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		order = Order.find(params[:id])
		order.order_status = params[:order_status]
		order.update
		if order.order_status == 1
			order_detiles = order.order_detiles
			order_detiles.each do |order_detile|
				order_detile.production_status = 1
				order_detile.update
			end
		end
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
