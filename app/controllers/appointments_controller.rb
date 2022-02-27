class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @current_user = current_user
    @appointment = Appointment.new
  end

  def create
    # @service = Service.find_by(id: params[:service_id])
    @current_user = current_user
    @service_id = params[:service_id]
    @appointment = Appointment.new(appointment_params.merge(user: @current_user, service_id: @service_id))

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to salon_service_appointments_path, notice: "appointment was successfully created." }
        format.json { render :index, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @salon = Salon.find_by(id: params[:salon_id])
    @service = @salon.services.find_by(id: params[:service_id])
    @appointments = @service.appointments.all
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time)
  end
end
