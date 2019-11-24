class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :get_appointment, only: [:accept, :reject]

  def index
    @appointments = current_patient.appointments if current_patient.present?
    @appointments = current_doctor.appointments if current_doctor.present?
  end

  def show
  end

  def new
    @appointment = current_patient.appointments.build
    @doctors = Doctor.all
  end

  def edit
  end

  def create
    @doctors = Doctor.all
    @appointment = current_patient.appointments.build(appointment_params.merge(doctor_id: params[:doctor_id],slot: params[:appointment][:slot] ))
    @unavalabity = Unavailability.where(doctor_id: params[:doctor_id], date: params[:appointment][:appointment_date], slot: params[:appointment][:slot])
    @booked_slot = Appointment.where(doctor_id: params[:doctor_id], appointment_date: params[:appointment][:appointment_date], slot: params[:appointment][:slot])
    respond_to do |format|
      if !@booked_slot.present?
        if !@unavalabity.present?
          if @appointment.save
            format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
            format.json { render :show, status: :created, location: @appointment }
          else
            format.html { render :new }
            format.json { render json: @appointment.errors, status: :unprocessable_entity }
          end
        else
          flash[:notice] = 'Doctor is not avalabile on this Date/Time'
          format.html { render :new }
        end
      else
        @booked_slot_by_current_patient = @booked_slot.where(patient_id: current_patient.id )
        if @booked_slot_by_current_patient.present?
          flash[:notice] = 'Appointment is already booked on same Date/Time by you.'
          format.html { render :new }
        else
          flash[:notice] = 'Appointment is already booked on same Date/Time by someone.'
          format.html { render :new }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @appointment.update_attributes(:status => "accepted")
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment is successfully accepted.' }
      format.json { head :no_content }
    end
  end

  def reject
    @appointment.update_attributes(status: "rejected")
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment is successfully rejected.' }
      format.json { head :no_content }
    end
  end

  private
    def get_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:appointment_date, :slot, :status, :details, :patient_id, :doctor_id)
    end
end
