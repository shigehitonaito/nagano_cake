class ApplicationController < ActionController::Base
	def after_sign_out_path_for(resource_or_scope)
     new_end_user_session_path
  end
end
