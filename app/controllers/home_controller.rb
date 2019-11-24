class HomeController < ApplicationController
  def index
    @appointments = current_patient.appointments if current_patient.present?
    @appointments = current_doctor.appointments if current_doctor.present?
  end
end
