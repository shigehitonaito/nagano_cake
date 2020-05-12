class Public::AddressesController < ApplicationController


    def index
    	@addresses = Address.where(end_user_id: current_end_user.id)
    end
	def new 
		@address = Address.new
	end

	def create
		address = Address.new(address_params)
		address.end_user_id = current_end_user.id
		address.save
		redirect_to public_addresses_path

	end 

	private
	def address_params
		params.require(:address).permit(:post_number, :address, :name)
	end
end
