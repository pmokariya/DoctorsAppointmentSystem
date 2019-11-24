module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_doctor
      flash.clear
      # if you have rails_doctor. You can redirect anywhere really
      redirect_to(root_path) && return
    elsif current_patient
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :patients do...
      redirect_to(root_path) && return
    end
  end
end
