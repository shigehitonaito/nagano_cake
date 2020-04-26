class Admin::EndUsersController < ApplicationController
 before_action :authenticate_admin!
	def index
		 @users = EndUser.with_deleted
	end
end
