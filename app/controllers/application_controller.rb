class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

	require 'ostruct'

	helper_method :current_coach
	helper_method :current_member

	#def current_coach
	#  @current_coach ||= Coach.find session[:coach_id] if session[:coach_id]
	#  if @current_coach
	#    @current_coach
	#  else
	#    OpenStruct.new(name: 'Gæst')
	#  end
	#end
	#def current_member
	#  @current_member ||= Member.find session[:member_id] if session[:member_id]
	#  if @current_member
	#    @current_member
	#  else
	#    OpenStruct.new(name: 'Gæst')
	#  end
	#end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    #in keys you list all the input you want to accept.
  end

end
