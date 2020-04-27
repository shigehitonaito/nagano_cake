class Public::EndUsersController < ApplicationController
   before_action :authenticate_end_user!


  def show
  	@user = EndUser.find(current_end_user.id)
  end

  def edit
  	@user = current_end_user
  end

  def update
  	user = current_end_user
  	user.update(end_user_params)
  	redirect_to public_end_users_path
  end

  def comfilm
  end

  def hide
    user= current_end_user
    user.id = current_end_user.id
    user.delete
    redirect_to new_end_user_registration_path
  end



  private

  def end_user_params
  	params.require(:end_user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :phone_number, :post_number, :address,:email)
  end

end
