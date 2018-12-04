module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_member
    before_action :check_coach
  end

  protected
  def check_member
    if current_coach
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(rails_coach.dashboard_path) && return
    elsif current_member
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_member_root_path) && return
    end
  end
  def check_coach
    if current_member
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(rails_member.dashboard_path) && return
    elsif current_coach
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_coach_root_path) && return
    end
  end
end