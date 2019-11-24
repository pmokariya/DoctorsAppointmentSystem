# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  def authenticate
    if current_doctor
      authenticate_doctor!
    else
      authenticate_patient!
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.class == Patient
      patient_path(resource)
    else
      doctor_path(resource)
    end
  end
end
