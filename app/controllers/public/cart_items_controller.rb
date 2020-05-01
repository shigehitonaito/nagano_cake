class Public::CartItemsController < ApplicationController

	def index
		@user = current_end_user
		@cart_items = @user.cart_items
	end

	def show
	end

	def create
		cart_item = CartItem.new(cart_item_params)
		cart_item.save
		redirect_to public_cart_items_path
	end

    def  update
    	cart_item = CartItem.find(params[:id])
    	cart_item.update(cart_item_params)
    	redirect_to public_cart_items_path
    end

    def destroy
    	cart_item = CartItem.find(params[:id])
    	cart_item.end_user_id = current_end_user.id
    	cart_item.delete
    	redirect_to public_cart_items_path
    end

    def destroy_all
		cart_items = CartItem.where(end_user_id: current_end_user.id)
		cart_items.delete_all
		redirect_to  public_cart_items_path
    end

	private
	def cart_item_params
		params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
	end

end
