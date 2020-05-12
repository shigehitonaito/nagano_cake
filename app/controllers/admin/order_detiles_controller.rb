class Admin::OrderDetilesController < ApplicationController

	def update
		order_detile = OrderDetile.find(params[:id])
		order_detile.update(order_detile_params)
		order = order_detile.order
		if order_detile.production_status_before_type_cast == 2
			order.order_status = 2
			order.update(order_params)
		elsif OrderDetile.where(order_id: order.id).count == OrderDetile.where(order_id: order.id).where(production_status: 3).count
			order.order_status = 4
			order.update(order_params)
		end
		redirect_to admin_items_path
	end 
	private
	def order_detile_params
		params.require(:order_detile).permit(:production_status)
	end

	def order_params
		params.permit(:order_status)
	end
end
