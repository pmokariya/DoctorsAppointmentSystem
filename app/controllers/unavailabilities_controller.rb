class UnavailabilitiesController < ApplicationController
  before_action :set_unavailability, only: [:show, :edit, :update, :destroy]

  def index
    @unavailabilities = current_doctor.unavailabilities.all
  end

  def show
  end

  def new
    @unavailability = current_doctor.unavailabilities.new
  end

  def edit
  end

  def create
    @unavailability = current_doctor.unavailabilities.new(unavailability_params)
    respond_to do |format|
      if @unavailability.save
        format.html { redirect_to unavailabilities_path, notice: 'Unavailability was successfully created.' }
        format.json { render :show, status: :created, location: @unavailability }
      else
        format.html { render :new }
        format.json { render json: @unavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @unavailability.update(unavailability_params)
        format.html { redirect_to @unavailability, notice: 'Unavailability was successfully updated.' }
        format.json { render :show, status: :ok, location: @unavailability }
      else
        format.html { render :edit }
        format.json { render json: @unavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unavailability.destroy
    respond_to do |format|
      format.html { redirect_to unavailabilities_url, notice: 'Unavailability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_unavailability
      @unavailability = current_doctor.unavailabilities.find(params[:id])
    end

    def unavailability_params
      params.require(:unavailability).permit(:slot, :date, :doctor_id)
    end
end
